<%-- 
    Document   : confirmar
    Created on : 5 dic. 2021, 12:43:08
    Author     : Jose Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Pizzas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page session="true" %>
<%

    Usuario usuario = (Usuario) getServletContext().getAttribute("usuario");

    if (usuario == null) {

        RequestDispatcher rd;
        ServletContext contex = getServletContext();

        rd = contex.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

    } else {

%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Telepizza</title>
    </head>
    <body>

        <div class="container-fluid" style="background-color: #e92829; height: 200px">

            <img src="imagenes/telepizza_logo_principal.jpg" width="400" height="200"/>

        </div>

        <div class="container-fluid row mt-5">

            <div class="col-6">

                <p class="text-end fw-bold">Gracias</p>
                <p class="text-end">${nombre}, tu pedido ha sido tramitado a las ${horaPedido} ${fecha}, y consta de los siguientes productos</p>

                <table class="table">
                    <thead class="text-center">
                        <tr >
                            <th scope="col">Cantidad</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Precio Unidad</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">

                        <%  ArrayList<Pizzas> lista = (ArrayList) session.getAttribute("listaPizzas");
                            ArrayList<Integer> listaCantidad = (ArrayList) session.getAttribute("listaCantidad");

                            double contador = 0;

                            for (int i = 0; i < lista.size(); i++) {
                         contador = contador + (listaCantidad.get(i) * lista.get(i).getPrecio());
                        %>
                        <tr>
                            <th><%= listaCantidad.get(i)%></th>
                            <th><%= lista.get(i).getNombrePizza()%></th>
                            <th><%= lista.get(i).getPrecio()%></th> 

                            
                        </tr>

                        <%}%>

                    </tbody>
                </table>

                <p class="text-end fw-bold">TOTAL PEDIDO: <%= Math.round(contador*100.0)/100.0%>€</p>

                <% if (session.getAttribute("tipoEnvio").equals("domicilio")) {
                %>
                <p class="text-end ">aproximadamente en 30 min sera servido el pedido en su domicilio</p>   
                <%
                } else {
                %>
                <p class="text-end ">podra recoger su pedido en unos 30 min en nuestra pizzeria</p>
                <%}%>

            </div> 

            <div class="col-6">

                <img class="rounded mx-auto d-block mt-5" src="imagenes/repartidor.JPG" alt="alt"/>

            </div> 



        </div>  


        <footer class="container-fluid " style="background-color: #e92829; height: 77px">

            <div class="row">

                <div class="col-3 fw-bold text-light p-2 ">

                    <h1>Telepizza España</h1>

                </div>

                <div class="col-2 mt-4">

                    <img src="imagenes/meGustaFaceBook.JPG" class="rounded float-start" width="100" />

                </div>

                <div class="col-7">

                    <img src="imagenes/insta.JPG" class="rounded float-end mt-3 me-3" width="50" />
                    <img src="imagenes/twitter.JPG" class="rounded float-end mt-3 me-3" width="50" />
                    <img src="imagenes/facebook.JPG" class="rounded float-end mt-3 me-3" width="50" />
                    <img src="imagenes/youtube.JPG" class="rounded float-end mt-3 me-3" width="50" />

                </div>



            </div>

        </footer>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>
<%}%>
