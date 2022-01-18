/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jose Antonio
 */
public class comprobarTelefono extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int numeroTelefono=Integer.parseInt(request.getParameter("telefono")) ;
        
        Usuario usuario = (Usuario) getServletContext().getAttribute("usuario");
        
        
        ServletContext contex= getServletContext();
        RequestDispatcher rd;
        
        if (numeroTelefono==usuario.getTelefono()) {
            
            HttpSession sesion= request.getSession();
    DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
    Date date = new Date();
    
    String hora=dateFormat.format(date);
            
        sesion.setAttribute("horaPedido", hora);
        rd=request.getRequestDispatcher("confirmar.jsp");
        rd.forward(request, response);

        } else {
            
            contex.setAttribute("error", "El telefono no es correcto");
            
            rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
        
        
    }


}
