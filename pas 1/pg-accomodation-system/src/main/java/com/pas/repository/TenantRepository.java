package com.pas.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.pas.entity.Tenant;

public interface TenantRepository extends JpaRepository<Tenant, Long> {}
