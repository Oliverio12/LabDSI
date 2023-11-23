<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sistema de Venta</h1>
        
        <div>
            <%@include file="MenuAdministrador.jsp" %>
        </div>
            <c:set var="usuario" value="${param.tfUsuario}" />
            <h2 style="text-align: center">Bienvenido 
                <c:out value="${usuario}"/>
                nos alegra tenerte devuelta</h2>
        
        <div>
            <%@include file="footer.html" %>
        </div>
    </body>

</html>
