<%-- 
    Document   : via
    Created on : 23/03/2021, 01:57:38 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<% String titulo = "Vias";%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../styles/main.css">
        <link rel="stylesheet" type="text/css" href="../styles/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
        <title><%= titulo.toString()%></title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <a class="button" href="../index.jsp">Ir a Inicio</a>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Tipo</th>
                        <th>Tipo Via</th>
                        <th>Numero</th>
                        <th>Nivel</th>
                        <th>Acciones</th>

                    </tr>
                </thead>
                <tbody>
                    <%  try {
                            Class.forName("com.mysql.jdbc.Driver");//se llaman las librerias para usarlas
                            con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                            /* se obtiene la conexion a la BD */
                            st = con.createStatement();//iniializamos 
                            rs = st.executeQuery("SELECT * FROM tb_via");//definimos Query a ejecutar
                            while (rs.next()) {//recorro los registros encontrados
                    %>
                    <!-- mostramos los datos en la tabla -->
                    <tr>
                        <th><%= rs.getString(1)%></th>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td>
                            <a class="action_button" href="editar.jsp?id=<%= rs.getString(1)%>&tipo=<%= rs.getString(2)%>&tipo_via=<%= rs.getString(3)%>&numero=<%= rs.getString(4)%>&niv_cong=<%= rs.getString(5)%>"><i class="fas fa-user-edit"></i></a>
                            <a class="action_button" href="borrar.jsp?id=<%= rs.getString(1)%>"><i class="fas fa-trash-alt"></i></a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.print("Error mysql " + e);
                        }
                    %>
                </tbody>
            </table>
                
                <div class="block_buttons">
                    <a href="crear.jsp" class="button"><i class="fas fa-user-plus"></i>Crear</a>
                </div>
        </div>
    </body>
</html>
