package com.centroclinico.demo;

import com.centroclinico.demo.services.AdministradorService;
import com.centroclinico.demo.services.AdministradorServiceImpl;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;


@Component
public class AdministradorController implements Initializable {


    @Autowired
    private AdministradorServiceImpl administradorServiceImpl;


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

    }



    @FXML
    private TextField nombre;

    @FXML
    private TextField apellido1;

    @FXML
    private TextField apellido2;

    @FXML
    private DatePicker fechaNacimiento;

    @FXML
    private TextField direccion;

    @FXML
    private TextField codPostal;

    @FXML
    private ComboBox<String> cbGenero;

    @FXML
    private Button borrar;

    @FXML
    private Button guardar;

    @FXML
    private void exit(ActionEvent event) {
        Platform.exit();
    }

    @FXML
    private void saveAdministrador(ActionEvent event) {

        Administrador administrador = new Administrador();

        administrador.setNombre(nombre.getText());
        administrador.setApellido1(apellido1.getText());
        administrador.setApellido2(apellido2.getText());
        administrador.setEdad(fechaNacimiento.getValue());

        Administrador newAdmin = administradorServiceImpl.save(administrador);

        saveAlert(newAdmin);

        clearFields();

    }

    @FXML
    private void saveAlert(Administrador administrador) {

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Administrador saved successfully.");
        alert.setHeaderText(null);
        alert.setContentText("The user " + administrador.getNombre() + " " + administrador.getApellido1() + " has been created ");
        alert.showAndWait();
    }



    private void clearFields() {
        nombre.clear();
        apellido1.clear();
        apellido2.clear();
        fechaNacimiento.getEditor().clear();
       // direccion.clear();
        // codPostal.clear();
        cbGenero.getSelectionModel().clearSelection();
        //rbMale.setSelected(true);
        //rbFemale.setSelected(false);
        //cbRole.getSelectionModel().clearSelection();
        //email.clear();
        //password.clear();
    }

    public String getNombre (){
        return nombre.getText();
    }

    public String getApellido1(){
        return apellido1.getText();
    }

    public String getApellido2(){
        return apellido2.getText();
    }

    public LocalDate getEdad() {
        return fechaNacimiento.getValue();
    }



}
