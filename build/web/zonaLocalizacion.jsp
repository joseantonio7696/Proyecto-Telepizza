<%-- 
    Document   : zonaLocalizacion
    Created on : 5 dic. 2021, 11:11:08
    Author     : Jose Antonio
--%>


<%@page import="Modelo.Pizzas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    RequestDispatcher rd;
    ServletContext contex = getServletContext();

    Usuario usuario = (Usuario) getServletContext().getAttribute("usuario");

    if (usuario == null) {

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

        <div class="container-fluid mb-4">

            <form class="row" style="text-align: center" method="post" action="tipoEnvio">

                <div class="col-6 ">

                    <img class="rounded mx-auto d-block mt-4" src="imagenes/motoReparto.JPG"  />

                    <div class="mt-4">
                        <label class="form-check-label" for="seleccion">
                            Entrega a domicilio
                        </label>
                        <input class="form-check-input" type="radio" value="domicilio" checked name="seleccion">
                    </div>

                </div>

                <div class="col-6 rounded float-end">

                    <img class="rounded mx-auto d-block mt-4" src="imagenes/tienda.JPG"/>
                    <div class="mt-4">
                        <label class="form-check-label" for="seleccion">
                            Recoger en tienda
                        </label>
                        <input class="form-check-input" value="tienda" type="radio" name="seleccion">
                    </div>
                </div>

                <div class="d-grid gap-2 col-1 mx-auto">
                    <input  class="mt-3 mb-4 btn-success" type="submit" value="Aceptar">
                </div>


            </form>

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
