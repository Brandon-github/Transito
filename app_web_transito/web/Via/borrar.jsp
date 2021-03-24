<%-- 
    Document   : borrar
    Created on : 23/03/2021, 06:52:21 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Agente</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            
            Connection con = null;
            Statement st = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");//se llaman las librerias de mysql para usarlas
                /*ponemos libreria, mysql, servidor, base de datos + usuario y contraseña a acceder */
                con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                /* se obtiene la conexion a la BD */
                st = con.createStatement();//iniializamos 
                st.executeUpdate("DELETE FROM tb_via WHERE id='"+id+"'");
                request.getRequestDispatcher("via.jsp").forward(request, response);

            } catch (Exception e) {
                System.err.print(e);
                out.print(e);
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
