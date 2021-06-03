package com.centroclinico.demo;

import javax.persistence.*;

@Entity
@Table(name="historial")
public class Historial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idHistorial;
}
