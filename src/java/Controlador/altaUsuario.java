/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jose Antonio
 */
public class altaUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext contex= getServletContext();
        RequestDispatcher rd;
        
        String usuario = request.getParameter("username");
        String contrasena= request.getParameter("contrasena");
        String domicilio= request.getParameter("userAddress");
        String email=request.getParameter("email");
        int telefono= Integer.parseInt(request.getParameter("telefono"));
        
        Usuario usuarios= new Usuario(usuario, contrasena, domicilio, email, telefono);
        
        boolean registrado= DAO.DbConnection.insertarUsuario(usuarios);
        
        if (registrado) {
            contex.setAttribute("mensaje", "El usuario se ha registrado con exito");
            rd=request.getRequestDispatcher("confirmacionAltaUsuario.jsp");
            rd.forward(request, response);
        } else {
            contex.setAttribute("error", "El usuario no se ha registrado con exito");
            rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
        
        
        
    }

}
