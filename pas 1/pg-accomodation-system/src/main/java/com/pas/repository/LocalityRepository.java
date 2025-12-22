package com.pas.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pas.entity.Locality;

public interface LocalityRepository extends JpaRepository<Locality, Long> {
    Optional<Locality> findByName(String name); 
}