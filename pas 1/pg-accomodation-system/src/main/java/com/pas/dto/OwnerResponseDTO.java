package com.pas.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Schema(description = "Data Transfer Object representing PG Owner details")
public class OwnerResponseDTO {

    @Schema(description = "Unique identifier of the owner", example = "501")
    private Long id;

    @Schema(description = "Full name of the owner", example = "Ramesh Kumar")
    private String name;

    @Schema(description = "Email address of the owner", example = "ramesh@example.com")
    private String email;

    @Schema(description = "Mobile number of the owner", example = "9876543210")
    private String mobile;

    @Schema(description = "Age of the owner (must be 18 or above)", example = "35")
    private int age;
}
