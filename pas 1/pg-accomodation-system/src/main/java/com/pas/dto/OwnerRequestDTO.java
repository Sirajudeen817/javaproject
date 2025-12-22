package com.pas.dto;

import com.pas.entity.Owner;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "Data Object for adding new PG Owner details")
public class OwnerRequestDTO {

    @Schema(description = "Full name of the owner", example = "Ramesh Kumar")
    private String name;

    @Schema(description = "Email address of the owner", example = "ramesh@example.com")
    private String email;

    @Schema(description = "Mobile number of the owner", example = "9876543210")
    private String mobile;

    @Schema(description = "Age of the owner (must be 18 or above)", example = "35")
    private int age;
    
    
    public Owner toOwnerEntity() {
    	Owner owner = new Owner();
		owner.setName(name);
		owner.setEmail(email);
		owner.setMobile(mobile);
		owner.setAge(age);
		return owner;
    }
}