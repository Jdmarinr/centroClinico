package com.centroclinico.demo.services;

import com.centroclinico.demo.Enfermero;
import com.centroclinico.demo.Paciente;

import java.util.List;

public interface EnfermeroService {


    List<Enfermero> findAll();

    Enfermero findById(Long id);

    Enfermero save(Paciente paciente);


}
