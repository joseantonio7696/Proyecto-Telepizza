<%-- 
    Document   : index
    Created on : 2 dic. 2021, 11:21:22
    Author     : Jose Antonio
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session= "false" %>
<%@page session="false" %>
<%

Usuario usuario= (Usuario)getServletContext().getAttribute("usuario");

if (usuario!=null) {
    RequestDispatcher rd;
ServletContext contex=getServletContext();
    rd=contex.getRequestDispatcher("menuLogin.jsp");
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
      
      <div class="row container-fluid mt-5">
          
          <div class="col-5 mb-3 text-center ">
              
              <h1>INICIAR SESION</h1>
              
              <form action="comprobarUsuario" method="post">
                  
                  <label for="usuario">Usuario</label>
                  <input class="form-control" type="text" name="usuario"/>
                  <br>
                  <label for="contrasena">Contraseña:</label>
                  <input class="form-control" type="password" name="contrasena"/>
                  <br>
                  
                  <input class="btn btn-success" type="submit" value="Entrar"/>
                  
              </form>
              
              <br>
              <a href="AltaUsuario.html" class="btn btn-primary">Registrar Usuario</a>
             
              
          </div>
          
          <div class="col-6">
              
              <img src="imagenes/imagenIniciojpg.jpg" class="rounded mx-auto d-block"  height="300" width="500"/>
              
              
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