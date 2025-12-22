package com.pas.entity;

import com.pas.dto.PGDetailDTO;

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
@Schema(description = "Represents a PG accommodation place posted by an owner")
public class PG {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the PG place", example = "1001")
    private Long id;

    @NotBlank 
    @Schema(description = "Registration number of the PG", example = "PG-REG-2025-001")
    private String registrationNumber;

    @Positive 
    @Schema(description = "Monthly rent amount for the PG", example = "7500.0")
    private Double rentAmount;

    @Positive 
    @Schema(description = "Built-up area of the PG in square feet", example = "1200.0")
    private Double builtUpArea;

    @Enumerated(EnumType.STRING)
    @Schema(description = "Availability status of the PG", example = "AVAILABLE")
    private PlaceStatus status = PlaceStatus.AVAILABLE;

    @ManyToOne(optional = false)
    @Schema(description = "Owner of the PG accommodation")
    private Owner owner;

    @ManyToOne(optional = false)
    @JoinColumn(name = "locality_id")
    @Schema(description = "Locality where the PG is located")
    private Locality locality;

    @Column(nullable = false)
    @Schema(description = "Number of visitors who viewed this PG post", example = "120")
    private long visitorCount = 0;

    
    
    
    public PGDetailDTO toDetailsDTO() {
        return PGDetailDTO.builder()
                .id(this.id)
                .registrationNumber(this.registrationNumber)
                .rentAmount(this.rentAmount)
                .builtUpArea(this.builtUpArea)
                .status(this.status)
                .ownerName(this.owner != null ? this.owner.getName() : null)
                .ownerContact(this.owner != null ? this.owner.getMobile() : null)
                .localityName(this.locality != null ? this.locality.getName() : null)
                .cityName(this.locality != null && this.locality.getCity() != null 
                            ? this.locality.getCity().getName() 
                            : null)
                .visitorCount(this.visitorCount)
                .build();
    }




	public PG(@NotBlank String registrationNumber, @Positive Double rentAmount, @Positive Double builtUpArea,
			PlaceStatus status, Owner owner, Locality locality) {
		this.registrationNumber = registrationNumber;
		this.rentAmount = rentAmount;
		this.builtUpArea = builtUpArea;
		this.status = status;
		this.owner = owner;
		this.locality = locality;
	}




	public void addVisitorCount() {
		visitorCount++;
	}

}
