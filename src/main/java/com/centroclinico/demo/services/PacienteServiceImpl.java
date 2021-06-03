package com.centroclinico.demo.services;

import com.centroclinico.demo.Paciente;
import com.centroclinico.demo.repository.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PacienteServiceImpl implements PacienteService {

    @Autowired
    private PacienteRepository pacienteRepository;


    @Override
    public List<Paciente> findAll() {
        return null;
    }

    @Override
    public Paciente findById(Long id) {
        return null;
    }

    @Override
    public Paciente save(Paciente paciente) {
        return null;
    }

    @Override
    public void deleteAllInBatch(List<Paciente> pacientes) {
        pacienteRepository.deleteAllInBatch(pacientes);
    }


}
