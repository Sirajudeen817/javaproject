package com.pas.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.pas.entity.Owner;

public interface OwnerRepository extends JpaRepository<Owner, Long> {}
