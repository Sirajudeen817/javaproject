package com.pas.entity;

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
@Schema(description = "Represents the admin who manages the application")
public class Admin {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the admin", example = "3001")
    private Long id;

    @NotBlank 
    @Schema(description = "Full name of the admin", example = "Admin User")
    private String name;

    @Email @NotBlank 
    @Schema(description = "Email address of the admin", example = "admin@example.com")
    private String email;

    @Min(18) 
    @Schema(description = "Age of the admin (must be 18 or above)", example = "40")
    private int age;
}
