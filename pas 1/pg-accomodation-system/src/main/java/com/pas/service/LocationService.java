package com.pas.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.dto.AddLocalityDTO;
import com.pas.dto.LocalityDetailDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.entity.City;
import com.pas.entity.Locality;
import com.pas.entity.PG;
import com.pas.exceptions.CityNotFoundException;
import com.pas.exceptions.LocalityNotFoundException;
import com.pas.repository.CityRepository;
import com.pas.repository.LocalityRepository;

@Service
public class LocationService {
    @Autowired private CityRepository cityRepository;
    @Autowired private LocalityRepository localityRepository;

	public Long addCity(String name) {
		City city = new City();
		city.setName(name);
		cityRepository.save(city);
		return city.getCityId();
	}

	public List<City> getAllCities() {
		return cityRepository.findAll();
	}

	public List<PGDetailDTO> getPGByCityId(Long cityId) {
	    City city = cityRepository.findById(cityId)
	            .orElseThrow(() -> new CityNotFoundException("City not found with " + cityId));

	    return city.getLocalities().stream()
	            .flatMap(locality -> locality.getPgPlaces().stream()) 
	            .map(PG::toDetailsDTO) 
	            .collect(Collectors.toList()); 
	}

	
	
    public List<PGDetailDTO> getPGsByLocalityName(String localityName) {
    	Locality locality = localityRepository.findByName(localityName).orElseThrow(() -> new LocalityNotFoundException("Locality not found with name "+ localityName));
        return locality.getPgPlaces().stream().map(pg -> pg.toDetailsDTO()).collect(Collectors.toList());
    }
	

	public Long addLocality(AddLocalityDTO ldto) {
		City city = cityRepository.findById(ldto.getCityId())
                .orElseThrow(() -> new CityNotFoundException("City not found with " + ldto.getCityId()));
		Locality locality = new Locality();
		locality.setName(ldto.getName());
		locality.setCity(city);
		locality.setPgPlaces(List.of());
		localityRepository.save(locality);
		return locality.getLocalityId();
	}

	public List<LocalityDetailDTO> getAllLocalities() {
		return localityRepository.findAll().stream().map(Locality::toDetailDTO).collect(Collectors.toList());
	}

    
}
