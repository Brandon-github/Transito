<%-- 
    Document   : agente
    Created on : 23/03/2021, 05:41:40 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<% String titulo = "Agentes de Transito";%>

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
                        <th>Nombre</th>
                        <th>Codigo</th>
                        <th>Años de experiencia</th>
                        <th>Codigo secretaria</th>
                        <th>Via actual</th>
                        <th>Acciones</th>

                    </tr>
                </thead>
                <tbody>
                    <%  try {
                            Class.forName("com.mysql.jdbc.Driver");//se llaman las librerias de mysql para usarlas
                            /*ponemos libreria, mysql, servidor, base de datos + usuario y contraseña a acceder */
                            con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                            /* se obtiene la conexion a la BD */
                            st = con.createStatement();//iniializamos 
                            rs = st.executeQuery("SELECT * FROM tb_agente");//definimos Query a ejecutar
                            while (rs.next()) {//recorro los registros encontrados validando si son existentes
                    %>
                    <!-- mostramos los datos en la tabla -->
                    <tr>
                        <th><%= rs.getString(1)%></th>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td>
                            <a class="action_button" href="editar.jsp?nombre=<%= rs.getString(1)%>&codigo=<%= rs.getString(2)%>&anos_exp=<%= rs.getString(3)%>&cod_sec=<%= rs.getString(4)%>&via_act=<%= rs.getString(5)%>"><i class="fas fa-user-edit"></i></a>
                            <a class="action_button" href="borrar.jsp?codigo=<%= rs.getString(2)%>"><i class="fas fa-trash-alt"></i></a>
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
