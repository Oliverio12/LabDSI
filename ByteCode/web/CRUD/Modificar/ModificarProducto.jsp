<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Producto</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarProducto">
                <div class="mb-3">
                    <label for="id_Producto" class="form-label">ID Producto</label>
                    <input type="text" class="form-control" name="id_Producto" id="id_Producto" value="${param.id_Producto}" required />
                </div>
                <div class="mb-3">
                    <label for="nombreProducto" class="form-label">Producto</label>
                    <input type="text" class="form-control" name="nombreProducto" id="nombreProducto" value="${param.nombreProducto}" required />
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" id="descripcion" value="${param.descripcion}" required />
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" step="0.01" min="0" class="form-control" name="precio" id="precio" value="${param.precio}" required />
                </div>
                <div class="mb-3">
                    <label for="id_Inventario" class="form-label">ID Inventario</label>
                    <input type="text" class="form-control" name="id_Inventario" id="id_Inventario" value="${param.id_Inventario}" required />
                </div>
                <div class="mb-3">
                    <label for="id_Marca" class="form-label">ID Marca</label>
                    <input type="text" class="form-control" name="id_Marca" id="id_Marca" value="${param.id_Marca}" required />
                </div>
                <div class="mb-3">
                    <label for="id_Categoria" class="form-label">ID Categoria</label>
                    <input type="text" class="form-control" name="id_Categoria" id="id_Categoria" value="${param.id_Categoria}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Producto?')">Modificar</button>
            </form>
                <div class="mb-3">
                    <label for="inventario" class="form-label">Inventario</label>
                    <input type="text" class="form-control" name="inventario" id="inventario" value="${param.inventario}" readonly />
                </div>
                <div class="mb-3">
                    <label for="marca" class="form-label">Marca</label>
                    <input type="text" class="form-control" name="marca" id="marca" value="${param.marca}" readonly />
                </div>
                <div class="mb-3">
                    <label for="categoria" class="form-label">Categoria</label>
                    <input type="text" class="form-control" name="categoria" id="categoria" value="${param.categoria}" readonly />
                </div>
                
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarProductos" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>