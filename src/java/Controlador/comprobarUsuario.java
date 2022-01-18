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
public class comprobarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext contex = getServletContext();
        RequestDispatcher rd;
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        String sql = "SELECT * FROM usuarios where User_name='" + usuario + "'";

        Usuario usuarios = DAO.DbConnection.consultarUsuario(sql);

        if (usuarios != null) {

            if (usuarios.getContrasena().equals(contrasena)) {

                HttpSession sesion = request.getSession();

                SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
                Calendar calendar = Calendar.getInstance();

                Date dateObj = calendar.getTime();
                String formattedDate = dtf.format(dateObj);

                DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
                Date date = new Date();

                String hora = dateFormat.format(date);

                sesion.setAttribute("fecha", formattedDate);
                sesion.setAttribute("hora", hora);

                sesion.setAttribute("nombre", usuarios.getNombreUsuario());
                contex.setAttribute("usuario", usuarios);

                rd = contex.getRequestDispatcher("/menuLogin.jsp");
                rd.forward(request, response);

            } else {

                contex.setAttribute("error", "La contraseña es incorrecta");
                rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            }

        } else {

            contex.setAttribute("error", "El usuario es incorrecto");
            rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);

        }

    }

}
