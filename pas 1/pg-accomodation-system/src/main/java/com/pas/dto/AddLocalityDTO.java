package com.pas.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "Request Body for adding a new locality")
public class AddLocalityDTO {

    @Schema(description = "Name of the locality", example = "Velachery")
    private String name;

    @Schema(description = "City Id to which this locality belongs")
    private Long cityId;
}
