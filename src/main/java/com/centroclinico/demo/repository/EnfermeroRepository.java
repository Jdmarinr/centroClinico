package com.centroclinico.demo.repository;

import com.centroclinico.demo.Enfermero;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnfermeroRepository extends JpaRepository<Enfermero, Long> {




}
