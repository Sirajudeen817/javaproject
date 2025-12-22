package com.pas.controller;

import com.pas.dto.AddPGDTO;
import com.pas.dto.OwnerRequestDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.entity.PlaceStatus;
import com.pas.service.OwnerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/owner")
@Tag(name = "Owner Endpoints", description = "Endpoints for Owners to manage PG accommodations")
public class OwnerController {

    @Autowired private OwnerService ownerService;
    
    @PostMapping("/register")
    @Operation(
            summary = "Register a owner",
            description = "Allows an owner to add himself to the database so he can add PG details",
            responses = {
                @ApiResponse(responseCode = "200", description = "Owner successfully added")
            }
        )
    public ResponseEntity<String> registerOwner(@RequestBody OwnerRequestDTO ownerDto) {
    	Long id =  ownerService.addOwner(ownerDto);
    	return ResponseEntity.ok("Owner registered!!! Id = " + id);
    }

    @PostMapping("/addpg/{owner_id}")
    @Operation(
        summary = "Add a new PG place",
        description = "Allows an owner to add a new PG accommodation with details such as rent, area, and locality.",
        responses = {
            @ApiResponse(responseCode = "200", description = "PG place successfully added"),
            @ApiResponse(responseCode = "400", description = "Invalid PG details provided")
        }
    )
    public ResponseEntity<String> addPGPlace(@RequestBody AddPGDTO pgDto, @PathVariable Long owner_id) {
    	Long pgId = ownerService.addPG(pgDto,owner_id);
        return ResponseEntity.ok("New PG with id = "+ pgId + " added to owner with ownerid = "+ owner_id);
    }

    @GetMapping("/places/{owner_id}")
    @Operation(
        summary = "Retrieve all PGs owned by the owner",
        description = "Fetches all PG accommodations posted by a specific owner.",
        parameters = {
            @Parameter(name = "owner_id", description = "Unique identifier of the owner", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "List of PGs retrieved successfully"),
            @ApiResponse(responseCode = "404", description = "Owner not found")
        }
    )
    public List<PGDetailDTO> getOwnerPlaces(@PathVariable Long owner_id) {
        return ownerService.getPGsByOwner(owner_id);
    }

    
    @PutMapping("/editstatus/{owner_id}/{pgId}")
    @Operation(
        summary = "Change PG status",
        description = "Updates the availability status of a PG (e.g., AVAILABLE to OCCUPIED).",
        parameters = {
        	@Parameter(name = "owner_id", description = "OWNER ID", required = true),
            @Parameter(name = "pgId", description = "PG ID", required = true),
            @Parameter(name = "status", description = "New status of the PG", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "PG status updated successfully"),
            @ApiResponse(responseCode = "400", description = "Failure to update"),
            @ApiResponse(responseCode = "404", description = "PG not found")
        }
    )
    public ResponseEntity<String> changePGStatus(@PathVariable Long owner_id, @PathVariable Long pgId, @RequestParam PlaceStatus status) {
        if(ownerService.updatePGStatus(pgId, status,owner_id))
        	return ResponseEntity.ok("PG Status Changed to " + status);
        else
        	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error in updating");
    }

    @PutMapping("/editdetails/{owner_id}/{pgId}")
    @Operation(
        summary = "Edit PG details",
        description = "Allows an owner to edit details of an existing PG accommodation.",
        responses = {
            @ApiResponse(responseCode = "200", description = "PG details updated successfully"),
            @ApiResponse(responseCode = "404", description = "PG not found")
        }
    )
    public ResponseEntity<String> editPGDetails(@PathVariable Long owner_id, @PathVariable Long pgId, @RequestBody AddPGDTO pgDto) {
        ownerService.updatePGDetails(pgId, pgDto, owner_id);
        return ResponseEntity.ok("Updated Successfully");
    }

    @DeleteMapping("/deletepg/{owner_id}")
    @Operation(
        summary = "Delete PG details",
        description = "Deletes a PG accommodation record from the system.",
        responses = {
            @ApiResponse(responseCode = "200", description = "PG deleted successfully"),
            @ApiResponse(responseCode = "404", description = "PG not found")
        }
    )
    public ResponseEntity<String> deletePG(@PathVariable Long owner_id, @RequestParam Long pgId) {
    	ownerService.deletePG(owner_id,pgId);
        return ResponseEntity.ok("PG Deleted Successfully");
    }
}
