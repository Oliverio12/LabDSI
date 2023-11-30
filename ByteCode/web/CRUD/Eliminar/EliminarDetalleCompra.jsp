<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cargo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <div class="container mt-5 mb-5 border p-4">
        <h1>Eliminar Cargo</h1>

        <form method="POST" action="/ByteCode/ServletPrincipal?accion=EliminarDetalleCompra">
            <div class="form-group">
                <label class="font-weight-bold">ID Detalle Compra ${param.id_DetalleCompra}</label><br>
                <label class="font-weight-bold">ID Compra:${param.id_Compra}</label><br>
                <label class="font-weight-bold">Compra: ${param.compra}</label><br>
                <label class="font-weight-bold">Cantidad: ${param.cantidad}</label><br>
                <label class="font-weight-bold">Precio: ${param.precioUnitario}</label><br>
                <label class="font-weight-bold">Estado: ${param.estadoCompra}</label><br>
                <label class="font-weight-bold">Total: ${param.total}</label><br>
                
                <input type="hidden" name="id_DetalleCompra" id="id_DetalleCompra" value="${param.id_DetalleCompra}" /><br><br>
                    <button type="submit" class="btn btn-danger" onclick="return confirm('¿Desea eliminar el cargo?')">Eliminar</button><br><br>
            </div>
            <div>
                <a class="btn btn-secondary" href="/ByteCode/?accion=GestionarDetalleCompra">Regresar</a><br><br>
            </div>             
        </form>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </div>
    </body>
</html>