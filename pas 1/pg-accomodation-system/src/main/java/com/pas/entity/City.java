package com.pas.entity;


import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "Represents a city where PG accommodations are located")
public class City {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(description = "Unique identifier for the city", example = "1")
    private Long cityId;

    @Size(min = 2, max = 30, message = "City Name should be between 2 and 30 characters")
    @Schema(description = "Name of the city", example = "Chennai")
    private String name;

    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
    @JsonIgnore
    @Schema(description = "List of localities within the city")
    private List<Locality> localities;
    
    public City(String name) {
    	this.name = name;
    }
}
