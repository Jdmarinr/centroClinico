package com.centroclinico.demo.controllers;

import com.centroclinico.demo.Paciente;
import com.centroclinico.demo.services.PacienteService;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@Component
public class PacienteController {


    @Autowired
    private PacienteService pacienteService;

    @FXML
    private TableView<Paciente> pacienteTable;

    @FXML
    private TableColumn<Paciente, Long> colPacienteId;

    @FXML
    private TableColumn<Paciente, String> colNombre;

    @FXML
    private TableColumn<Paciente, String> colApellido1;

    @FXML
    private TableColumn<Paciente, String> colApellido2;

    @FXML
    private TableColumn<Paciente, LocalDate> colFechaNac;


    @FXML
    private TableColumn<Paciente, String> colTipoPrueba;

    @FXML
    private TableColumn<Paciente, Boolean> colResultado;

    @FXML
    private MenuItem deletePacientes;

    private ObservableList<Paciente> pacienteList = FXCollections.observableArrayList();

    @FXML
    private TextField nombre;

    @FXML
    private TextField apellido1;

    @FXML
    private TextField apellido2;

    @FXML
    private TextField direccion;


    @FXML
    private TextField textFielCodPostal;

    @FXML
    private Button btnBorrar;

    @FXML
    private Button btnGuardar;


    @FXML
    private void savePaciente(ActionEvent event){

        Paciente paciente = new Paciente();

        paciente.setNombre(paciente.getNombre());
        paciente.setApellido1(paciente.getApellido1());
        paciente.setApellido2(paciente.getApellido2());
        paciente.setEdad(paciente.getEdad());

        Paciente newPaciente = pacienteService.save(paciente);

    }


    /*
     *  Add All pacientes to observable list and update table
     */
    private void loadUserDetails() {
        pacienteList.clear();
        pacienteList.addAll(pacienteService.findAll());

        pacienteTable.setItems(pacienteList);
    }


    @FXML
    private void deletePacientes(ActionEvent event) {
        List<Paciente> pacientes = pacienteTable.getSelectionModel().getSelectedItems();

        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Confirmation Dialog");
        alert.setHeaderText(null);
        alert.setContentText("Are you sure you want to delete selected?");
        Optional<ButtonType> action = alert.showAndWait();

        if (action.get() == ButtonType.OK) pacienteService.deleteAllInBatch(pacientes);

        loadUserDetails();
    }


}
