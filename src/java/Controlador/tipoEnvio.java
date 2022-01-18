/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
public class tipoEnvio extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion= request.getSession();
        RequestDispatcher rd;
        
        
        String tipoEnvio= request.getParameter("seleccion");
        
        
        sesion.setAttribute("tipoEnvio", tipoEnvio);
        rd=request.getRequestDispatcher("confirmarTelefono.jsp");
        rd.forward(request, response);
        
        
    }

    

}
