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
        <style type="text/css">
            #container .form_search .filter_options{
                height: 80px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            
            #container .form_search .filter_options .option{
                margin: 0 40px;
            }
            
            #container .form_search .filter_options .option label{
                font-size: 1.2em;
                font-weight: 700;
                color: var(--clr-fondo-terciario);
            }
            
            #container .form_search .filter_options .option span{
                width: 20px;
                height: 20px;
                border: 3px solid var(--clr-fondo-secundario);
                border-radius: 50%;
                display: inline-block;
                position: relative;
                top: 3px;
                pointer-events: none;
            }
            
            #container .form_search .filter_options .option span:before{
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 8px;
                height: 8px;
                background: var(--clr-fondo-secundario);
                transform: translate(-50%,-50%) scale(0);
                border-radius: 50%;
            }
            
            #container .form_search .filter_options .option input{
                position: relative;
                left: 20px;
                opacity: 0;
            }
            
            #container .form_search .filter_options .option input:checked ~ span:before{
                transform: translate(-50%,-50%) scale(1);
            }
        </style>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String texto = request.getParameter("buscador");
            String filtro = request.getParameter("tipo");
            boolean entrar = false;
        %>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <a class="button" href="../index.jsp">Ir a Inicio</a>

            <form action="buscador.jsp" method="GET" class="form_search">
                <input type="search" name="buscador" id="buscador">
                <button type="submit"><i class="fas fa-search"></i></button>
                <% if(filtro != null){ entrar = true; } %>
                <div class="filter_options">
                    <div class="option">
                        <input type="radio" name="tipo" value="agente" id="agente">
                        <span></span>
                        <label for="agente">Agente</label>
                    </div>
                    <div class="option">
                        <input type="radio" name="tipo" value="via" id="via">
                        <span></span>
                        <label for="via">Via</label>
                    </div>
                </div>

            </form>
            <table>
                <thead>
                    <tr>
                        <%
                            try {
                                if (filtro.equalsIgnoreCase("agente") || filtro.equalsIgnoreCase("via")) {
                        %>
                                    <th>Nombre</th>
                                    <th>Codigo</th>
                                    <th>Años de experiencia</th>
                                    <th>Codigo secretaria</th>
                                    <th>Via actual</th>
                            
                        <%
                                }else{
                                }
                            } catch (java.lang.NullPointerException e) {
                                if(entrar){
                                    out.print("<h2 style='color:#f00;'>"+ e + "\nSelecione Filtro a realizar</h2>");
                                }
                            }
                        %>
                    </tr>
                </thead>
                <tbody>
                    <%  try {
                            Class.forName("com.mysql.jdbc.Driver");//se llaman las librerias de mysql para usarlas
                            /*ponemos libreria, mysql, servidor, base de datos + usuario y contraseña a acceder */
                            con = DriverManager.getConnection("jdbc:mysql://localhost/db_transito?user=brandon&password=bama159123456789");
                            /* se obtiene la conexion a la BD */
                            st = con.createStatement();//iniializamos 
                            try {
                                    if(filtro.equalsIgnoreCase("agente")){
                                        rs = st.executeQuery("SELECT * FROM tb_agente WHERE codigo LIKE " + '"' + texto + "%" + '"');
                                    }else if(filtro.equalsIgnoreCase("via")){
                                        rs = st.executeQuery("SELECT * FROM tb_agente WHERE via_act LIKE " + '"' + texto + "%" + '"');
                                    }
                            } catch (java.lang.NullPointerException e) {
                                if(entrar){
                                    System.err.println(e);
                                }
                            }
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
                            if(entrar){
                                out.print("Error mysql " + e);
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>

