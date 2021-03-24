<%-- 
    Document   : index
    Created on : 23/03/2021, 04:13:41 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String titulo = "Agencia de Transito Vial";%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= titulo.toString()%></title>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
    </head>
    <body>
        <div id="container">
            <h1 id="titulo"><%= titulo.toString()%></h1>
            <div class="block_buttons">
                <a href="Agente/agente.jsp" class="button"><i class="fas fa-street-view"></i>Agentes de Transito</a>
                <a href="Via/via.jsp" class="button"><i class="fas fa-road"></i>Vias</a>
            </div>
            <div class="block_buttons" style="background: none; border: none;">
                <a href="Buscador/buscador.jsp" class="button" style="padding: 20px 200px;">Buscar</a>
            </div>
            <footer>
                <p>Autor | <span>Brandon Alexis Machado Ambuila</span></p>
            </footer>
        </div>

    </body>
</html>
