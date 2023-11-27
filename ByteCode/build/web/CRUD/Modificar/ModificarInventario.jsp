<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Inventario</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Inventario</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarInventario">
                <div class="mb-3">
                    <label for="id_Inventario" class="form-label">ID Inventario</label>
                    <input type="text" min="0" class="form-control" name="id_Inventario" id="id_Inventario" value="${param.id_Inventario}" readonly />
                </div>
                <div class="mb-3">
                    <label for="stock" class="form-label">Stock:</label>
                    <input type="number" min="0" class="form-control" name="stock" id="stock" value="${param.stock}" required />
                </div>
                <div class="mb-3">
                    <label for="nombreProducto" class="form-label">Producto: </label>
                    <input type="text" class="form-control" name="nombreProducto" id="nombreProducto" value="${param.nombreProducto}" required />
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" id="descripcion" value="${param.descripcion}" required />
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="text" class="form-control" name="precio" id="precio" value="${param.precio}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaAdquisicion" class="form-label">Adquirido</label>
                    <input type="date" class="form-control" name="fechaAdquisicion" id="fechaAdquisicion" value="${param.fechaAdquisicion}" readonly />
                </div>
                <div class="mb-3">
                    <label for="fechaUltimaActualizacion" class="form-label">Actualizacion</label>
                    <input type="date" class="form-control" name="fechaUltimaActualizacion" id="fechaUltimaActualizacion" value="${param.fechaUltimaActualizacion}" readonly />
                </div>
                <div class="mb-3">
                    <label for="categoria" class="form-label">categoria</label>
                    <input type="text" class="form-control" name="categoria" id="categoria" value="${param.categoria}" required />
                </div>
                <div class="mb-3">
                    <label for="proveedor" class="form-label">proveedor</label>
                    <input type="text" class="form-control" name="proveedor" id="proveedor" value="${param.proveedor}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Inventario?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarInventario" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
                     document.addEventListener('DOMContentLoaded', function () {
                         var fechaActual = new Date();
                         var formattedFechaActual = fechaActual.toISOString().split('T')[0];

                         document.getElementById('fechaUltimaActualizacion').value = formattedFechaActual;
                     });
        </script>

    </body>
</html>