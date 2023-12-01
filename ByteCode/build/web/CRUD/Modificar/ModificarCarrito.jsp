<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Carrito</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Carrito</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarCarrito">
                <div class="mb-3">
                    <label for="id_Carrito" class="form-label">ID Carrito</label>
                    <input type="text" class="form-control" name="id_Carrito" id="id_Carrito" value="${param.id_Carrito}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Producto" class="form-label">ID Producto</label>
                    <input type="text" class="form-control" name="id_Producto" id="id_Producto" value="${param.id_Producto}" required />
                </div>
                <div class="mb-3">
                    <label for="producto" class="form-label">Producto</label>
                    <input type="text" class="form-control" name="producto" id="producto" value="${param.producto}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Venta" class="form-label">ID Venta</label>
                    <input type="text" class="form-control" name="id_Venta" id="id_Venta" value="${param.id_Venta}" required />
                </div>
                <div class="mb-3">
                    <label for="venta" class="form-label">Venta</label>
                    <input type="text" class="form-control" name="venta" id="venta" value="${param.venta}" readonly />
                </div>
                <div class="mb-3">
                    <label for="cantidad" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" id="cantidad" value="${param.cantidad}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaAgregado" class="form-label">Fecha Agregado</label>
                    <input type="date" class="form-control" name="fechaAgregado" id="fechaAgregado" value="${param.fechaAgregado}" readonly />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Carrito?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarCarritos" class="btn btn-secondary">Regresar</a>
            </div>
        </div>

       
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>