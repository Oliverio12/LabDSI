<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cargo</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Cargo</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarMarca">
                <div class="mb-3">
                    <label for="id_Marca" class="form-label">ID Marca</label>
                    <input type="text" class="form-control" name="id_Marca" id="id_Marca" value="${param.id_Marca}" readonly />
                </div>
                <div class="mb-3">
                    <label for="nombreMarca" class="form-label">Marca</label>
                    <input type="text" class="form-control" name="nombreMarca" id="nombreMarca" value="${param.nombreMarca}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar la Marca?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarMarca" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>