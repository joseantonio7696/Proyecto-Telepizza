/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelo.Pizzas;
import Modelo.Usuario;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jose Antonio
 */
public class DbConnection {

   private static String usuario = "root";
    private static String password = "";
    private static String servidor = "localhost:3306";
    private static String bd = "telepizza";
    
    public static Connection CrearConexion() {

        Connection cn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://" + servidor + "/" + bd;
            cn = (Connection) DriverManager.getConnection(url, usuario, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        } catch (SQLException ex) {
            System.out.println("Otra excepcion" + ex.toString());
        }

        return cn;
    }

    public static boolean insertarUsuario(Usuario usuarios) {
        
        Connection cn;
        
        cn=CrearConexion();
        
        String sql="INSERT INTO `usuarios`(`id`, `User_name`, `User_password`, `User_address`, `User_email`, `User_phone`) "
                + "VALUES (?,?,?,?,?,?)";
        
       try {
           PreparedStatement pst= (PreparedStatement) cn.prepareStatement(sql);
           
           pst.setInt(1, 0);
           pst.setString(2, usuarios.getNombreUsuario());
           pst.setString(3, usuarios.getContrasena());
           pst.setString(4, usuarios.getDomicilio());
           pst.setString(5, usuarios.getEmail());
           pst.setInt(6, usuarios.getTelefono());
           
           pst.executeUpdate();
           
           return true;
           
       } catch (SQLException ex) {
           return false;
       }
 
    }

    public static Usuario consultarUsuario(String sql) {
        
        Usuario usuario=null;
        
        Connection cn;
        
        cn=CrearConexion();
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           rs.next();
           
           usuario=new Usuario(rs.getString(2),rs.getString(3) , rs.getString(4), rs.getString(5), rs.getInt(6));
           
           return usuario;
           
       } catch (SQLException ex) {
           return usuario;
       }
        
    }
    
    public static ArrayList<Pizzas> consultaPizzas(String sql) {
        
        Pizzas pizza=null;
        
        ArrayList<Pizzas> listaPizzas=new ArrayList<Pizzas>();
        
        Connection cn;
        
        cn=CrearConexion();
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           while(rs.next()){
               
              pizza=new Pizzas(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4));
              
              listaPizzas.add(pizza);
                      
                      
                      
           }
           
           
           
           return listaPizzas;
           
       } catch (SQLException ex) {
           
           return listaPizzas;
       }
        
    }
    
     public static Pizzas consultaPizza(String sql) {
        
        Pizzas pizza=null;
        
        
        
        Connection cn;
        
        cn=CrearConexion();
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           rs.next();
               
           pizza=new Pizzas(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4));
         
           
           
           
           return pizza;
           
       } catch (SQLException ex) {
           
           return pizza;
       }
        
    }
}
