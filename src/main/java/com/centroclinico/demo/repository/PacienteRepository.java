package com.centroclinico.demo.repository;

import com.centroclinico.demo.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PacienteRepository extends JpaRepository <Paciente, Long> {



}
