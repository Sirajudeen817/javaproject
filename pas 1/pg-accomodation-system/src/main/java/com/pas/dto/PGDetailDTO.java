package com.pas.dto;

import com.pas.entity.PlaceStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "Data Transfer Object representing PG accommodation details")
public class PGDetailDTO {

    @Schema(description = "Unique identifier of the PG place", example = "1001")
    private Long id;

    @Schema(description = "Registration number of the PG", example = "PG-REG-2025-001")
    private String registrationNumber;

    @Schema(description = "Monthly rent amount for the PG", example = "7500.0")
    private Double rentAmount;

    @Schema(description = "Built-up area of the PG in square feet", example = "1200.0")
    private Double builtUpArea;

    @Schema(description = "Availability status of the PG", example = "AVAILABLE")
    private PlaceStatus status;

    @Schema(description = "Name of the PG owner", example = "Ramesh Kumar")
    private String ownerName;

    @Schema(description = "Contact number of the PG owner", example = "9876543210")
    private String ownerContact;

    @Schema(description = "Name of the locality where PG is located", example = "Velachery")
    private String localityName;

    @Schema(description = "Name of the city where PG is located", example = "Chennai")
    private String cityName;

    @Schema(description = "Number of visitors who viewed this PG post", example = "120")
    private long visitorCount;
}
