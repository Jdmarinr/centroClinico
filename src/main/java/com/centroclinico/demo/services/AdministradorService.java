package com.centroclinico.demo.services;


import com.centroclinico.demo.Administrador;
import com.centroclinico.demo.generic.GenericService;
import com.centroclinico.demo.repository.AdministradorRepository;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;


public interface AdministradorService  {

    Administrador save(Administrador administrador);

    List<Administrador> findAll();

    //Iterable<Administrador> findAllById(Iterable<Long> ids);

}
