package com.pas.service;


import com.pas.dto.OwnerResponseDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.entity.*;
import com.pas.exceptions.PGNotFoundException;
import com.pas.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PGService {

    @Autowired private PGRepository pgRepository;

    public PGDetailDTO getPGDetails(Long id) {
        PG pg = pgRepository.findById(id).orElseThrow(() -> new PGNotFoundException("PG not found"));
        pg.addVisitorCount();
        pgRepository.save(pg);
        return pg.toDetailsDTO();
    }
    
    
    public void deletePG(Long id) {
        pgRepository.deleteById(id);
    }


	public OwnerResponseDTO getOwnerDetails(Long id) {
		PG pg = pgRepository.findById(id).orElseThrow(() -> new PGNotFoundException("PG not found"));
        return pg.getOwner().toResponseDTO();
	}


}