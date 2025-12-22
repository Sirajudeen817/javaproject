package com.pas.controller;

import com.pas.dto.AddLocalityDTO;
import com.pas.dto.LocalityDetailDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.service.LocationService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/locality")
@Tag(name = "Locality Controller", description = "Admin operations for managing Localities")
public class LocalityController {

    @Autowired private LocationService locationService;

    @PostMapping
    @Operation(
        summary = "Add a new Locality",
        description = "Creates a new locality under a specific city. Ensure that the city is set properly.",
        responses = {
            @ApiResponse(responseCode = "200", description = "Locality successfully created. The locality Id will be returned"),
            @ApiResponse(responseCode = "400", description = "Invalid locality details provided")
        }
    )
    public ResponseEntity<String> addLocality(@RequestBody AddLocalityDTO ldto) {
    	Long id = locationService.addLocality(ldto);
    	return ResponseEntity.ok("Locality created with id = " + id);
    }

    @GetMapping
    @Operation(
        summary = "Get all Localities",
        description = "Retrieves a list of all localities available in the system.",
        responses = {
            @ApiResponse(responseCode = "200", description = "List of localities retrieved successfully")
        }
    )
    public List<LocalityDetailDTO> getAllLocalities() {
        return locationService.getAllLocalities();
    }
    
    @GetMapping("/pgs/{locality}")
    @Operation(
        summary = "Retrieve PGs in a locality",
        description = "Lists all available PG accommodations in a specific locality.",
        parameters = {
            @Parameter(name = "locality", description = "Name of the locality", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "List of PGs retrieved successfully"),
            @ApiResponse(responseCode = "404", description = "Locality not found")
        }
    )
    public List<PGDetailDTO> getPGsByLocality(@PathVariable String locality) {
        return locationService.getPGsByLocalityName(locality);
    }
}
