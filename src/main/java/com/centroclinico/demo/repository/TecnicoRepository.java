package com.centroclinico.demo.repository;

import com.centroclinico.demo.Tecnico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TecnicoRepository extends JpaRepository <Tecnico, Long> {
}
