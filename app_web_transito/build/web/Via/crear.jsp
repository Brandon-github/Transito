<%-- 
    Document   : crear
    Created on : 23/03/2021, 02:02:39 PM
    Author     : Usuario
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String titulo = "Crear Via";%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../styles/main.css">
        <link rel="stylesheet" type="text/css" href="../styles/style.css">
        <title><%= titulo.toString()%></title>
    </head>
    <body>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <form action="crear.jsp" method="POST" class="form">
                <div class="form_camp">
                    <label for="tipo">Tipo</label>
                    <select name="tipo" id="tipo">
                        <option value="Autopista" selected="true">Autopista</option>
                        <option value="Carreteta Principal" selected>Carreteta Principal</option>
                        <option value="Carreteta Seundaria">Carreteta Seundaria</option>
                    </select>
                </div>
                <div class="form_camp">
                    <label for="tipo">Tipo</label>
                    <select name="tipo_via" id="tipo_via">
                        <option value="Calle" selected="true">Calle</option>
                        <option value="Carreteta">Carreteta</option>
                    </select>
                </div>
                <div class="form_camp">
                    <label for="numero">Numero</label>
                    <input type="text" name="numero" id="numero" placeholder="ingrese numero de via" required="required">
                </div>
                <div class="form_camp">
                    <label for="niv_cong">Nivel de Congestion 0 - 100</label>
                    <input type="text" name="niv_cong" id="niv_cong" placeholder="ingrese nivel de congestion" required="required">
                </div>
                <a href="via.jsp" class="button">Cancelar</a>
                <button type="submit" name="enviar" class="button">Guardar</button>
            </form>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String tipo = request.getParameter("tipo");
                String tipo_via = request.getParameter("tipo_via");
                String numero = request.getParameter("numero");
                String niv_cong = request.getParameter("niv_cong");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                    st = con.createStatement();
                    st.executeUpdate("INSERT INTO tb_via(tipo,tipo_via,numero,nivel) VALUES('"+tipo+"','"+tipo_via+"','"+numero+"','"+niv_cong+"');");
                    request.getRequestDispatcher("via.jsp").forward(request, response);
                    System.out.println("funciona");
                } catch (Exception e) {
                    System.err.println(e);

                }

            }
        %>
    </body>
</html>
