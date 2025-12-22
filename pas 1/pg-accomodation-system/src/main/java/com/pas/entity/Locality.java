package com.pas.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import com.pas.dto.LocalityDetailDTO;

import io.swagger.v3.oas.annotations.media.Schema;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "Represents a locality within a city where PGs are available")
public class Locality {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the locality", example = "101")
    private Long localityId;

    @Size(min = 4, max = 30)
    @Schema(description = "Name of the locality", example = "Velachery")
    private String name;

    @ManyToOne
    @JoinColumn(name = "city_id")
    @Schema(description = "City to which this locality belongs")
    private City city;
    
    @OneToMany(mappedBy = "locality", cascade = CascadeType.ALL)
    @Schema(description = "List of PG accommodations available in this locality")
    private List<PG> pgPlaces;
    
    
    public LocalityDetailDTO toDetailDTO() {
    	return LocalityDetailDTO.builder()
    			.localityId(localityId)
    			.name(name)
    			.cityId(city.getCityId())
    			.pgCount(pgPlaces.size())
    			.build();
    }
}
