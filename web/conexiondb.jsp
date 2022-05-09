<%-- 
    Document   : conexiondb
    Created on : May 8, 2022, 7:31:13 PM
    Author     : Juan Carlos
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 class="tituloDatos">Listado de Usuario</h1>
        <div>
            <table border="1" width="800" class="tablaDatos">
                <tr class="filas">
                    <th colspan="8">Mantenimiento de Usuarios</th>
                    <th id="img-agregar"><a href="index.jsp">
                            <img src="Iconos/agregar-usuario.png"></a></th>
                </tr>
                <tr class="filas">
                    <th>Codigo</th><th>Nombre</th>
                    <th>Apellido</th><th>Edad</th>
                    <th>Telefono</th><th>Correo</th>
                    <th>Genero</th><th>Contraseña</th>
                    <th>Accion</th>
                </tr>

                <%
                    /*Creacion de variables para realizar la conexion, insertar y consultar 
                datos en la base de datos de prueba*/

                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppWeb?user=root&password=jc");

                        sta = cnx.createStatement();
                        rs = sta.executeQuery("select * from usuarios");

                        while (rs.next()) {
                %>
                <tr>
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getString(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    <th><%=rs.getString(6)%></th>
                    <th><%=rs.getString(7)%></th>
                    <th><%=rs.getString(8)%></th>
                    <th class="filas">
                        <img src="Iconos/editar-usuario.png">
                        <img src="Iconos/eliminar-usuario.png">
                             
                    </th>
                </tr>
                <%
                            /*Cerrando la conexion de las variables para realizar la conexion, insertar y consultar 
                datos en la base de datos de prueba*/

                        }
                        sta.close();
                        rs.close();
                        cnx.close();
                    } catch (Exception e) {

                    }
                %>
            </table>


        </div>
    </body>
</html>
