package com.pas.entity;

import com.pas.dto.OwnerResponseDTO;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "Represents the owner who posts PG accommodations")
public class Owner {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the owner", example = "501")
    private Long id;

    @NotBlank 
    @Schema(description = "Full name of the owner", example = "Ramesh Kumar")
    private String name;

    @Email @NotBlank 
    @Schema(description = "Email address of the owner", example = "ramesh@example.com")
    private String email;

    @NotBlank 
    @Schema(description = "Mobile number of the owner", example = "9876543210")
    private String mobile;

    @Min(18) 
    @Schema(description = "Age of the owner (must be 18 or above)", example = "35")
    private int age;

	public OwnerResponseDTO toResponseDTO() {
		return OwnerResponseDTO.builder()
					.id(id)
					.name(name)
					.email(email)
					.mobile(mobile)
					.age(age)
					.build();
	}
}
