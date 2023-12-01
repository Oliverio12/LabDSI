<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Metodo de Pago</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Metodo de Pago</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarMetodosPago">
                <div class="mb-3">
                    <label for="idMetodoPago" class="form-label">ID Metodo de Pago</label>
                    <input type="text" class="form-control" name="idMetodoPago" id="idMetodoPago" value="${param.idMetodoPago}" readonly/>
                </div>
                <div class="mb-3">
                    <label for="metodo" class="form-label">Metodo</label>
                    <input type="text" class="form-control" name="metodo" id="metodo" value="${param.metodo}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Metodos de Pago?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarMetodosPago" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>