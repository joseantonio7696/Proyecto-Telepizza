/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Jose Antonio
 */
public class Usuario {
    
   private String nombreUsuario;
   private String contrasena;
   private String domicilio;
   private String email;
   private int telefono;

    public Usuario(String nombreUsuario, String contrasena, String domicilio, String email, int telefono) {
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
        this.domicilio = domicilio;
        this.email = email;
        this.telefono = telefono;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
   
   
   
   
   
   
   
   
   
}
