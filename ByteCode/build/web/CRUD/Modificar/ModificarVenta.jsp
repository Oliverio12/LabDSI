<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Venta</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Venta</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarVenta">
                <div class="mb-3">
                    <label for="id_Venta" class="form-label">ID Venta </label>
                    <input type="text" class="form-control" name="id_Venta" id="id_Venta" value="${param.id_Venta}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Cliente" class="form-label">ID Cliente </label>
                    <input type="text" class="form-control" name="id_Cliente" id="id_Cliente" value="${param.id_Cliente}" required />
                </div>
                <div class="mb-3">
                    <label for="cliente" class="form-label">Cliente </label>
                    <input type="text" class="form-control" name="cliente" id="cliente" value="${param.cliente}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Usuario" class="form-label">ID Usuario </label>
                    <input type="text" class="form-control" name="id_Usuario" id="id_Usuario" value="${param.id_Usuario}" required />
                </div>
                <div class="mb-3">
                    <label for="usuarioEmpleado" class="form-label">Usuario Empleado </label>
                    <input type="text" class="form-control" name="usuarioEmpleado" id="usuarioEmpleado" value="${param.usuarioEmpleado}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Pago" class="form-label">ID Pago </label>
                    <input type="text" class="form-control" name="id_Pago" id="id_Pago" value="${param.id_Pago}" required />
                </div>
                <div class="mb-3">
                    <label for="pago" class="form-label">Pago: </label>
                    <input type="text" class="form-control" name="pago" id="pago" value="${param.pago}" readonly />
                </div>
                <div class="mb-3">
                    <label for="fechaVenta" class="form-label">Fecha Venta</label>
                    <input type="date" class="form-control" name="fechaVenta" id="fechaVenta" value="${param.fechaVenta}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Cargo?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarVenta" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>