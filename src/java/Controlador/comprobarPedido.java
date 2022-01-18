/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Pizzas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class comprobarPedido extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext contex= getServletContext();
        RequestDispatcher rd;
        HttpSession sesion= request.getSession();
        
        
        String seleccionAmantes= request.getParameter("amantes");
        
        int cantidadAmantes= Integer.parseInt(request.getParameter("cantidadAmantes"));
        
        String seleccionQueseros= request.getParameter("queseros");
        
        int cantidadQueseros= Integer.parseInt(request.getParameter("cantidadQueseros"));
        
        String seleccionClasicos= request.getParameter("clasicos");
        
        int cantidadClasicos= Integer.parseInt(request.getParameter("cantidadClasicos"));
        
        String seleccionInfantil= request.getParameter("infantil");
        
        int cantidadInfantil= Integer.parseInt(request.getParameter("cantidadInfantil"));
        
        String seleccionNatural= request.getParameter("natural");
        
        int cantidadNatural= Integer.parseInt(request.getParameter("cantidadNatural"));
        
        ArrayList<Pizzas> listaPizzas = new ArrayList<Pizzas>();
        ArrayList<Integer> listaCantidad = new ArrayList<Integer>();
        
        Pizzas pizza=null;
        String sql="";

        if ((!seleccionAmantes.equals("vacio") && cantidadAmantes!=0) || (!seleccionClasicos.equals("vacio")&& cantidadClasicos!=0) || (!seleccionInfantil.equals("vacio") && cantidadInfantil!=0) || (!seleccionNatural.equals("vacio")&& cantidadNatural!=0) || (!seleccionQueseros.equals("vacio")&& cantidadQueseros!=0)) {
            
            if (!seleccionAmantes.equals("vacio")&&cantidadAmantes!=0) {
                
                sql="SELECT * FROM pizzas WHERE id='"+seleccionAmantes+"'";
                pizza=DAO.DbConnection.consultaPizza(sql);
                
                listaPizzas.add(pizza);
                listaCantidad.add(cantidadAmantes);
           
                sesion.setAttribute("cantidadAmantes", cantidadAmantes);
                
            }
            
            if (!seleccionClasicos.equals("vacio")&&cantidadClasicos!=0) {
                
                sql="SELECT * FROM pizzas WHERE id='"+seleccionClasicos+"'";
                pizza=DAO.DbConnection.consultaPizza(sql);
                
                listaPizzas.add(pizza);
                listaCantidad.add(cantidadClasicos);
                
                
                sesion.setAttribute("cantidadClasicos", cantidadClasicos);
            }
            
            if (!seleccionInfantil.equals("vacio")&&cantidadInfantil!=0) {
                
                sql="SELECT * FROM pizzas WHERE id='"+seleccionInfantil+"'";
                pizza=DAO.DbConnection.consultaPizza(sql);
                
                listaPizzas.add(pizza);
                listaCantidad.add(cantidadInfantil);
              
                sesion.setAttribute("cantidadInfantil", seleccionInfantil);
            }
            
            if (!seleccionNatural.equals("vacio")&&cantidadNatural!=0) {
                
                sql="SELECT * FROM pizzas WHERE id='"+seleccionNatural+"'";
                pizza=DAO.DbConnection.consultaPizza(sql);
                
                listaPizzas.add(pizza);
                listaCantidad.add(cantidadNatural);

                sesion.setAttribute("cantidadNatural", cantidadNatural);
            }
            
            if (!seleccionQueseros.equals("vacio")&&cantidadQueseros!=0) {
                
                sql="SELECT * FROM pizzas WHERE id='"+seleccionQueseros+"'";
                pizza=DAO.DbConnection.consultaPizza(sql);
                
                listaPizzas.add(pizza);
                listaCantidad.add(cantidadQueseros);
             
                sesion.setAttribute("cantidadQueseros", cantidadQueseros);
            }
            
            
            sesion.setAttribute("listaPizzas", listaPizzas);
            sesion.setAttribute("listaCantidad", listaCantidad);
            
            rd=request.getRequestDispatcher("zonaLocalizacion.jsp");
            rd.forward(request, response);
            
            
        } else {
            
            rd=request.getRequestDispatcher("menuLogin.jsp");
            rd.forward(request, response);
        }
        
        
        
        
    }


}
