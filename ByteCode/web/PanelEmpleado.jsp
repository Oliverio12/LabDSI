<%-- 
    Document   : PanelEmpleado
    Created on : 12 oct 2023, 18:37:35
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div>
            <%@include file="MenuEmpleado.html" %>
        </div>
        <%String usuario = request.getParameter("tfUsuario");%>
        <h2 style="text-align: center">Bienvenido <%=usuario%> nos alegra tenerte devuelta</h2>


    </body>
</html>
