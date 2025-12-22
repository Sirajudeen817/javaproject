package com.pas.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.dto.AddPGDTO;
import com.pas.dto.OwnerRequestDTO;
import com.pas.dto.PGDetailDTO;
import com.pas.entity.Locality;
import com.pas.entity.Owner;
import com.pas.entity.PG;
import com.pas.entity.PlaceStatus;
import com.pas.exceptions.InvalidOwnerException;
import com.pas.exceptions.LocalityNotFoundException;
import com.pas.exceptions.OwnerNotFoundException;
import com.pas.exceptions.PGNotFoundException;
import com.pas.repository.LocalityRepository;
import com.pas.repository.OwnerRepository;
import com.pas.repository.PGRepository;

@Service
public class OwnerService {
    @Autowired private OwnerRepository ownerRepository;
    @Autowired private PGRepository pgRepository;
    @Autowired private LocalityRepository localityRepository;

	
	public Long addOwner(OwnerRequestDTO ownerDto) {
		Owner owner = ownerDto.toOwnerEntity();
		owner = ownerRepository.save(owner);
		return owner.getId();
	}
	
	
    public Long addPG(AddPGDTO pgDto, Long owner_id) {
        Owner owner = ownerRepository.findById(owner_id)
                .orElseThrow(() -> new OwnerNotFoundException("Owner not found with id = " + owner_id));
        
        Locality locality = localityRepository.findByName(pgDto.getLocalityName())
                .orElseThrow(() -> new LocalityNotFoundException("Locality not found with "+ pgDto.getLocalityName()));
        PG pg = new PG(pgDto.getRegistrationNumber(),pgDto.getRentAmount(),pgDto.getBuiltUpArea(),pgDto.getStatus(),owner,locality);
        pgRepository.save(pg);
        return pg.getId();
    }


	public boolean updatePGStatus(Long id, PlaceStatus status,Long owner_id) {
		try {
		      PG pg = pgRepository.findById(id).orElseThrow(() -> new PGNotFoundException("PG not found"));
		      if(pg.getOwner().getId() == owner_id)
		      {
		    	  pg.setStatus(status);
		    	  pgRepository.save(pg);
		    	  return true;
		      }else 
		    	  return false;
		} catch(Exception e) {
			return false;
		}
	}


	public void updatePGDetails(Long pgId, AddPGDTO dto, Long owner_id) {
        Owner owner = ownerRepository.findById(owner_id)
                .orElseThrow(() -> new OwnerNotFoundException("Owner not found with id = " + owner_id));
        PG pg = pgRepository.findById(pgId).orElseThrow(() -> new PGNotFoundException("PG not found"));
	    if(pg.getOwner().getId() != owner.getId())
	    	throw new InvalidOwnerException("Cannot delete a PG that you dont own");
	    Locality locality = pg.getLocality();
	    if(locality.getName() != dto.getLocalityName()) {
	        Locality newLocality = localityRepository.findByName(dto.getLocalityName())
	                .orElseThrow(() -> new LocalityNotFoundException("Locality not found with name "+ dto.getLocalityName()));
	        pg.setLocality(newLocality);
	    }
	    pg.setRegistrationNumber(dto.getRegistrationNumber());
	    pg.setStatus(dto.getStatus());
        pg.setRentAmount(dto.getRentAmount());
        pg.setBuiltUpArea(dto.getBuiltUpArea());
        pgRepository.save(pg);
	}
	
    public List<PGDetailDTO> getPGsByOwner(Long ownerId) {
        return pgRepository.findByOwnerId(ownerId)
                .stream().map(PG::toDetailsDTO).collect(Collectors.toList());
    }
    
    public void deletePG(Long owner_id,Long id) {
        Owner owner = ownerRepository.findById(owner_id)
                .orElseThrow(() -> new OwnerNotFoundException("Owner not found with id = " + owner_id));
	    PG pg = pgRepository.findById(id).orElseThrow(() -> new PGNotFoundException("PG not found"));
	    
	    if(pg.getOwner().getId() != owner.getId())
	    	throw new InvalidOwnerException("Cannot delete a PG that you dont own");
        pgRepository.deleteById(id);
    }
}
