<%-- 
    Document   : confirmarTelefono
    Created on : 5 dic. 2021, 12:07:24
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

        <div class="container-fluid mt-5">
            
            

            <form class="row" style="text-align: center" method="post" action="comprobarTelefono">
                
                <p class=" mt-5 text-center text-danger fw-bold">${nombre} usted debe indicar su telefono para confirmar su pedido </p>

                <div class="col-12 rounded mx-auto d-block">
                
                    <input type="number" maxlength="9" name="telefono" required>
                
                <br>
                
                <input class="btn-success mt-3" type="submit" value="Tramitar Pedido"/>

                
                </div>
            </form>

        </div>  


        <footer class="container-fluid fixed-bottom " style="background-color: #e92829; height: 77px">

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
