<%-- 
    Document   : editar
    Created on : 23/03/2021, 02:53:16 PM
    Author     : Usuario
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String titulo = "Editar Agente";%>
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
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
            st = con.createStatement();
            
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String codigo = request.getParameter("codigo");
            String años_exp = request.getParameter("anos_exp");
            String codigo_sec = request.getParameter("cod_sec");
            String via_act = request.getParameter("via_act");
        %>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <form action="editar.jsp" method="GET" class="form">
                <div class="form_camp">
                    <label for="codigo">Codigo</label>
                    <input type="hidden" name="codigo" value="<%= codigo %>" id="codigo" placeholder="ingrese su codigo" required="required">
                </div>
                <div class="form_camp">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" id="nombre" value="<%= nombre %>" placeholder="ingrese su nombre" required="required">
                </div>
                <div class="form_camp">
                    <label for="apellido">Apellido</label>
                    <input type="text" name="apellido" id="apellido" value="<%= apellido %>" placeholder="ingrese su apellido" required="required">
                </div>
                <div class="form_camp">
                    <label for="anos_exp">Años Experiencia</label>
                    <input type="text" name="anos_exp" value="<%= años_exp %>" id="anos_exp" placeholder="ingrese años experiencia" required="required">
                </div>
                <div class="form_camp">
                    <label for="cod_sec">Codigo Secretaria</label>
                    <input type="text" name="cod_sec" value="<%= codigo_sec %>" id="cod_sec" placeholder="ingrese codigo secretaria" required="required">
                </div>
                <div class="form_camp">
                    <label for="via_act">Via Actual</label>
                    <!--<input type="text" name="via_act" id="via_act" placeholder="ingrese via actual" required="required">-->
                    <select name="via_act">
                        <%
                          rs = st.executeQuery("SELECT id, tipo_via, numero FROM tb_via");
                          while(rs.next()){ %>
                            <option value="<%= rs.getString("id") %>"><%= rs.getString("tipo_via")+" "+rs.getString("numero") %></option>
                         <% } %>
                    </select>
                </div>
                <a href="agente.jsp" class="button">Cancelar</a>
                <button type="submit" name="enviar" class="button">Guardar</button>
            </form>
        </div>
        <%
            if (request.getParameter("enviar") != null) {

                try {
                    st.executeUpdate("UPDATE tb_agente SET nombre='"+nombre+"',apellido='"+apellido+"',anos_exp='"+años_exp+"',codigo_sec='"+codigo_sec+"',via_act='"+via_act+"' WHERE codigo='"+codigo+"';");
                    request.getRequestDispatcher("agente.jsp").forward(request, response);
                    System.out.println("funcionaa");
                } catch (Exception e) {
                    System.err.println(e);

                }

            }
        %>
    </body>
</html>
