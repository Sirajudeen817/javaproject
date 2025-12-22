package com.pas.controller;


import com.pas.dto.OwnerResponseDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.service.PGService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/pg")
@Tag(name = "PG Service Endpoints", description = "Public endpoints for tenants to search and view PG accommodations")
public class PGController {

    @Autowired private PGService pgService;

    @GetMapping("/details/{id}")
    @Operation(
        summary = "Retrieve PG details",
        description = "Fetches detailed information about a specific PG accommodation.",
        parameters = {
            @Parameter(name = "id", description = "Unique identifier of the PG", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "PG details retrieved successfully"),
            @ApiResponse(responseCode = "404", description = "PG not found")
        }
    )
    public PGDetailDTO getPGDetails(@PathVariable Long id) {
        return pgService.getPGDetails(id);
    }

    @GetMapping("/owner/{id}")
    @Operation(
        summary = "Retrieve PG owner details",
        description = "Fetches the owner’s contact information for a specific PG accommodation. Contact details are only available if the PG status is AVAILABLE.",
        parameters = {
            @Parameter(name = "id", description = "Unique identifier of the PG", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "Owner details retrieved successfully"),
            @ApiResponse(responseCode = "404", description = "PG not found")
        }
    )
    public OwnerResponseDTO getOwnerDetails(@PathVariable Long id) {
        OwnerResponseDTO ownerDTO = pgService.getOwnerDetails(id);
        return ownerDTO;
    }
}
