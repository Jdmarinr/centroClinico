package com.centroclinico.demo;

import javafx.application.Application;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class CclinicoApplication {

    public static void main(String[] args) {

        Application.launch(Clinica.class, args);
    }

}
