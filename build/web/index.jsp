<%-- 
    Document   : index
    Created on : May 6, 2022, 10:13:44 AM
    Author     : Juan Carlos
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="cuadro">
            <form action="conexiondb.jsp" method="post">
                <p class="titulo">FORMULARIO DE REGISTRO</p>
                <hr/>
                <br/><br/>
                
                <label id="nombre">Nombre:</label>
                <br/><br/>
                <input type="text" class="entrada"name="nombre">
                <br/><br/>

                <label id="apellido" name="apellido">Apellido:</label>
                <br/><br/>
                <input type="text" class="entrada" name="apellido">
                <br/><br/>

                <label id="edad" name="edad">Edad:</label>
                <br/><br/>
                <input type="number" class="entrada" name="edad">
                <br/><br/>

                <label id="telefono" name="telefono">Teléfono:</label>
                <br/><br/>
                <input type="text" class="entrada" name="telefono">
                <br/><br/>

                <label id="correo">Correo Electrónico:</label> 
                <br/><br/>
                <input type="email" class="entrada" name="correo"/>
                <br/><br/>

                <label id="genero">Genero:</label><br/><br/>
                <input type="radio" name="genero" value="M"checked>Masculino
                <input type="radio" name="genero" value="F">Femenino
                <br/><br/>

                <label id="pass">Contraseña:</label> 
                <br/><br/>
                <input type="pass" class="entrada" name="pass"/>
                <br/><br/>

                <input type="submit" name="btnRegistrar" value="Registrar" class="boton">
                <input type="reset" value="Borrar" class="boton">
                <br/>

                <a href="conexiondb.jsp">Conexion</a>
                <a href="Inicio.jsp">Inicio</a>
                
            </form>

            <%
                if (request.getParameter("btnRegistrar") != null) {
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String telefono = request.getParameter("telefono");
                    String correo = request.getParameter("correo");
                    String genero = request.getParameter("genero");
                    String pass = request.getParameter("pass");

                    Connection cnx = null;
                    ResultSet rs = null;
                    Statement sta = null;

                    try {
                        Class.forName("com.mysql.jdbx.Driver");
                        cnx = DriverManager.getConnection("jdbc:mysql://localhost:3036/AppWeb?user=root&password");

                        sta = cnx.createStatement();

                        sta.executeUpdate("insert into usuarios  values ('" + nombre + "','" + apellido + "','" + edad + "','" + telefono + "','" + correo + "','" + genero + "','" + pass + "')");
                        request.getRequestDispatcher("conexiondb.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e + " ");
                    }
                }
            %>

            <br/>
            <p id="marca">JUAN</p>
        </div>
    </body>
</html>
