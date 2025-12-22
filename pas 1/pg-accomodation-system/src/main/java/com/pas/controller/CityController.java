package com.pas.controller;


import com.pas.dto.PGDetailDTO;
import com.pas.entity.City;
import com.pas.service.LocationService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/city")
@Tag(name = "City Service Endpoints", description = "Admin operations for managing Cities")
public class CityController {
    
    @Autowired private LocationService locationService;
    

    @PostMapping
    @Operation(
        summary = "Add a new City",
        description = "Creates a new city record in the system. The city name must be between 2 and 30 characters.",
        responses = {
            @ApiResponse(responseCode = "200", description = "City successfully created"),
            @ApiResponse(responseCode = "400", description = "Invalid city details provided")
        }
    )
    public ResponseEntity<String> addCity(@RequestParam String name) {
        Long id =  locationService.addCity(name);
        return ResponseEntity.ok("Locality created with id = " + id);
    }

    @GetMapping
    @Operation(
        summary = "Get all Cities",
        description = "Retrieves a list of all cities available in the system.",
        responses = {
            @ApiResponse(responseCode = "200", description = "List of cities retrieved successfully")
        }
    )
    public List<City> getAllCities() {
        return locationService.getAllCities();
    }
    
    
    @GetMapping("/pgs/{city_id}")
    @Operation(
        summary = "Retrieve PGs in a city by Id",
        description = "Fetches all available PG accommodations in a specific city.",
        parameters = {
            @Parameter(name = "city_id", description = "Unique identifier of the city", required = true)
        },
        responses = {
            @ApiResponse(responseCode = "200", description = "List of PGs retrieved successfully"),
            @ApiResponse(responseCode = "404", description = "City not found")
        }
    )
    public List<PGDetailDTO> getPGsByCity(@PathVariable Long city_id) {
        return locationService.getPGByCityId(city_id);
    }
}

