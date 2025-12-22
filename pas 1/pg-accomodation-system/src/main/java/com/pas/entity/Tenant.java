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
@Schema(description = "Represents a tenant who registers and opts for PG accommodation")
public class Tenant {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the tenant", example = "2001")
    private Long id;

    @NotBlank 
    @Schema(description = "Full name of the tenant", example = "Priya Sharma")
    private String name;

    @Email @NotBlank 
    @Schema(description = "Email address of the tenant", example = "priya@example.com")
    private String email;

    @NotBlank 
    @Schema(description = "Mobile number of the tenant", example = "9123456789")
    private String mobile;

    @Min(18) 
    @Schema(description = "Age of the tenant (must be 18 or above)", example = "23")
    private int age;

    @ManyToOne
    @JoinColumn(name = "pg_id")
    @Schema(description = "PG accommodation opted by the tenant")
    private PG pg;
}
