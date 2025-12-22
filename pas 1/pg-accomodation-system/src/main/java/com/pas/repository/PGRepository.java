package com.pas.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pas.entity.PG;
import com.pas.entity.PlaceStatus;
import java.util.List;

public interface PGRepository extends JpaRepository<PG, Long> {

    // Traverses PG -> Locality -> City -> Name
    List<PG> findByLocality_City_NameAndStatus(String cityName, PlaceStatus status);

    // Traverses PG -> Locality -> Name
    List<PG> findByLocality_NameAndStatus(String localityName, PlaceStatus status);
    
    List<PG> findByOwnerId(Long ownerId);
}