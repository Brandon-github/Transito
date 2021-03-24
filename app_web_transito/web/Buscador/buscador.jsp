<%-- 
    Document   : buscador
    Created on : 23/03/2021, 07:21:49 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<% String titulo = "Buscador";%>

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
            
            String texto = request.getParameter("buscador");
        %>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <a class="button" href="../index.jsp">Ir a Inicio</a>
            
            <form action="buscador.jsp" method="GET" class="form_search">
                <input type="search" name="buscador" id="buscador">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Codigo</th>
                        <th>Años de experiencia</th>
                        <th>Codigo secretaria</th>
                        <th>Via actual</th>
                    </tr>
                </thead>
                <tbody>
                    <%  try {
                            Class.forName("com.mysql.jdbc.Driver");//se llaman las librerias de mysql para usarlas
                            /*ponemos libreria, mysql, servidor, base de datos + usuario y contraseña a acceder */
                            con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                            /* se obtiene la conexion a la BD */
                            st = con.createStatement();//iniializamos 
                            rs = st.executeQuery("SELECT * FROM tb_agente WHERE codigo LIKE "+'"'+texto+"%"+'"');//busca el caracter(s) similares
                            while (rs.next()) {//recorro los registros encontrados validando si son existentes
                    %>
                    <!-- mostramos los datos en la tabla -->
                    <tr>
                        <th><%= rs.getString(1)%></th>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.print("Error mysql " + e);
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>

