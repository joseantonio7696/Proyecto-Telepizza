<%-- 
    Document   : menuLogin
    Created on : 2 dic. 2021, 10:58:15
    Author     : Jose Antonio
--%>

<%@page import="Modelo.Pizzas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%


Usuario usuario= (Usuario)getServletContext().getAttribute("usuario");

if (usuario==null) {
    
    RequestDispatcher rd;
ServletContext contex=getServletContext();
    
    rd=contex.getRequestDispatcher("/index.jsp");
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
            
      <div class="row text-danger">
          
          <p class="text-end">Bienvenido ${nombre} </p>
          
          <p class="text-end">Usted ha accedido a nuestra zona de pedidos a las ${hora} del ${fecha}</p>
          
      </div>
      
      <div class="row container-fluid mt-5">
          
          <div class="col-6 text-center mb-3 ">
              
              <% 
                  String sql="SELECT * FROM pizzas WHERE idpizza='2'";
                  
                  ArrayList<Pizzas> listaAmantesCarne = DAO.DbConnection.consultaPizzas(sql); 

                  sql="SELECT * FROM pizzas WHERE idpizza='3'";
                  
                  ArrayList<Pizzas> listaQueseros = DAO.DbConnection.consultaPizzas(sql);
                  
                  sql="SELECT * FROM pizzas WHERE idpizza='4'";
                  
                  ArrayList<Pizzas> listaClasicos = DAO.DbConnection.consultaPizzas(sql);
                  
                  sql="SELECT * FROM pizzas WHERE idpizza='5'";
                  
                  ArrayList<Pizzas> listaNatural = DAO.DbConnection.consultaPizzas(sql);
                  
                  sql="SELECT * FROM pizzas WHERE idpizza='6'";
                  
                  ArrayList<Pizzas> listaInfantil = DAO.DbConnection.consultaPizzas(sql);

              
              %>
              
              <form class="row" action="comprobarPedido" method="post">
                  
                  <div class="col-4">
                     
                      <label class="text-danger fw-bold form-label mb-3" for="amantes">Amantes de la carne:</label>
                      
                      <label class="text-danger fw-bold form-label mt-5 mb-3" for="queseros">Los más queseros:</label>
                      
                      <label class="text-danger fw-bold form-label mt-5 mb-3" for="clasicos">Los Clasicos:</label>
                      <br>
                      <label class="text-danger fw-bold form-label mt-5 mb-3" for="infantil">Infantil:</label>
                      <br>
                      <label class="text-danger fw-bold form-label mt-5 mb-3" for="natural">Los Naturales:</label>
                      
                  </div>
                  
                  <div class="col-6">
                      
                      <select class="form-control" name="amantes">
                      <option value="vacio">Seleccione un producto</option>
                      <%for (Pizzas pizzasCarne : listaAmantesCarne) {
                      %>
                      <option value="<%=pizzasCarne.getId()%>"><%= pizzasCarne.getNombrePizza()%> -> <%=pizzasCarne.getPrecio() %></option>

                      <%}%>
                  </select> 
                  <br><br>
                  <select class="form-control" name="queseros">
                      <option value="vacio">Seleccione un producto</option>
                      <%for (Pizzas pizzasQueseros : listaQueseros) {
                      %>
                      <option value="<%=pizzasQueseros.getId()%>"><%= pizzasQueseros.getNombrePizza()%> -> <%=pizzasQueseros.getPrecio() %></option>

                      <%}%>
                  </select>
                  
                  <br><br>
                  <select class="form-control" name="clasicos">
                      <option value="vacio">Seleccione un producto</option>
                      <%for (Pizzas pizzasClasicos : listaClasicos) {
                      %>
                      <option value="<%=pizzasClasicos.getId()%>"><%= pizzasClasicos.getNombrePizza()%> -> <%=pizzasClasicos.getPrecio() %></option>

                      <%}%>
                  </select>
                  
                  <br><br>
                  <select class="form-control" name="infantil">
                      <option value="vacio">Seleccione un producto</option>
                      <%for (Pizzas pizzasInfantil : listaInfantil) {
                      %>
                      <option value="<%=pizzasInfantil.getId()%>"><%= pizzasInfantil.getNombrePizza()%> -> <%=pizzasInfantil.getPrecio() %></option>

                      <%}%>
                  </select>
                  
                  <br><br>
                  <select class="form-control" name="natural">
                      <option value="vacio">Seleccione un producto</option>
                      <%for (Pizzas pizzasNatural : listaNatural) {
                      %>
                      <option value="<%=pizzasNatural.getId() %>"><%= pizzasNatural.getNombrePizza()%> -> <%=pizzasNatural.getPrecio() %></option>

                      <%}%>
                  </select>
                      
                  </div>
                  
                  <div class="col-2 ">
                     
                      <select class="form-control" name="cantidadAmantes">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                  </select>
                     <br><br>
                  <select class="form-control" name="cantidadQueseros">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                  </select>
                     
                     <br><br>
                  <select class="form-control" name="cantidadClasicos">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                  </select>
                     
                     <br><br>
                  <select class="form-control" name="cantidadInfantil">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                  </select>
                     
                     <br><br>
                  <select class="form-control" name="cantidadNatural">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                  </select>
                      
                  </div>
                  
                  <input type="submit" value="Confirmar Pedido" class="btn btn-success">

              </form>
 
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