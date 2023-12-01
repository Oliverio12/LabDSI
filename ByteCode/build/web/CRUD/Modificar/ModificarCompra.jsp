<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Compra</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Compra</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarCompra">
                <div class="mb-3">
                    <label for="id_Compra" class="form-label">ID Compra</label>
                    <input type="text" class="form-control" name="id_Compra" id="id_Compra" value="${param.id_Compra}" readonly />
                </div>
                <div class="mb-3">
                    <label for="proveedor" class="form-label">Proveedor</label>
                    <input type="text" class="form-control" name="proveedor" id="proveedor" value="${param.proveedor}" required />
                </div>
                <div class="mb-3">
                    <label for="nombreCompra" class="form-label">Compra</label>
                    <input type="text" class="form-control" name="nombreCompra" id="nombreCompra" value="${param.nombreCompra}" required />
                </div>
                <div class="mb-3">
                    <label for="fecha_Compra" class="form-label">Fecha Compra</label>
                    <input type="date" class="form-control" name="fecha_Compra" id="fecha_Compra" value="${param.fecha_Compra}" readonly />
                </div>
                <div class="mb-3">
                    <label for="total" class="form-label">Total</label>
                    <input type="text" class="form-control" name="total" id="total" value="${param.total}" required />
                </div>
                <div class="mb-3">
                    <label for="estado" class="form-label">Estado</label>
                    <input type="text" class="form-control" name="estado" id="estado" value="${param.estado}" required />
                </div>
                <div class="mb-3">
                    <label for="id_Empleado" class="form-label">ID Empleado</label>
                    <input type="text" class="form-control" name="id_Empleado" id="id_Empleado" value="${param.id_Empleado}" required />
                </div>
                <div class="mb-3">
                    <label for="empleado" class="form-label">Empleado</label>
                    <input type="text" class="form-control" name="empleado" id="empleado" value="${param.empleado}"  readonly />
                </div>
                <div class="mb-3">
                    <label for="descripcionCompra" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcionCompra" id="descripcionCompra" value="${param.descripcionCompra}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar la compra?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarCompra" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>