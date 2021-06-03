package com.centroclinico.demo.services;

import com.centroclinico.demo.Paciente;

import java.util.List;

public interface PacienteService {


    List<Paciente> findAll();

    Paciente findById(Long id);

    Paciente save(Paciente paciente);


    void deleteAllInBatch(List<Paciente> pacientes);
}
