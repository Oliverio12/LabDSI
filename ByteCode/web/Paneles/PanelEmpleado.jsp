<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Empleado</title>
        <style>
            .byteCode {
            background-color: #007bff;
            padding: 20px;
            text-align: center;
        }

        .Titulo {
            color: #ffffff;
            font-size: 2.5em;
            margin: 0;
        }

        .container-bytecode {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .welcome {
            font-size: 1.5em;
            margin: 20px 0;
            color: #007bff;
        }

        strong {
            color: #0056b3;
        }
        </style>
    </head>
    <body>
        <div class="byteCode"><h1 class="Titulo">ByteCode Sistema de Tienda en Linea</h1></div>

        <div>
            <%@include file="MenuEmpleados.jsp" %>
        </div>

        <c:set var="usuario" value="${param.tfUsuario}" />
        <div class="container-bytecode">
            <h3 class="welcome">
                <strong>¡Bienvenido, <c:out value="${usuario}" />!</strong>
                <br><br> Nos alegra tenerte de vuelta
            </h3>
        </div>


        <div>
            <%@include file="footer.html" %>
        </div>

    </body>
</html>
