package com.pas.dto;

import com.pas.entity.PlaceStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "Data Transfer Object representing PG accommodation details")
public class AddPGDTO {

    @Schema(description = "Registration number of the PG", example = "PG-REG-2025-001")
    private String registrationNumber;

    @Schema(description = "Monthly rent amount for the PG", example = "7500.0")
    private Double rentAmount;

    @Schema(description = "Built-up area of the PG in square feet", example = "1200.0")
    private Double builtUpArea;

    @Schema(description = "Availability status of the PG", example = "AVAILABLE")
    private PlaceStatus status;

    @Schema(description = "Id of the locality where PG is located", example = "Velachery")
    private String localityName;
}
