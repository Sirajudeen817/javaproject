package com.pas.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;


@Data
@Builder
@Schema(description = "Response Details of a locality")
public class LocalityDetailDTO {
	
    @Schema(description = "Unique identifier for the locality", example = "101")
    private Long localityId;
	
    @Schema(description = "Name of the locality", example = "Velachery")
    private String name;

    @Schema(description = "City Id to which this locality belongs")
    private Long cityId;
    
    @Schema(description = "Count of PG accommodations available in this locality")
    private int pgCount;
}
