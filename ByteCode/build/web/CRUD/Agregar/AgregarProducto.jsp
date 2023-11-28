<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Producto</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container mt-5 mb-5 border p-4">
            <c:if test="${exito!=null}">
                <c:if test="${exito}">
                    <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
                </c:if>
                <c:if test="${!exito}">
                    <p><strong style="color: red;">No se guardó la información</strong></p>
                </c:if>
            </c:if>   
            <h1>Agregar nuevo Producto</h1>

            <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarProducto">
                <div class="mb-3">
                    <label for="nombreProducto" class="form-label"> <strong> Producto: </strong></label>
                    <input type="text" class="form-control" name="nombreProducto" id="nombreProducto" required />
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label"> <strong> Descripcion: </strong></label>
                    <input type="text" class="form-control" name="descripcion" id="descripcion" required />
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label"> <strong> Precio: </strong></label>
                    <input type="precio" min="0" step="0.01" class="form-control" name="precio" id="precio" required />
                </div>
                <div class="mb-3">
                    <label for="id_Inventario" class="form-label"> <strong> id_Inventario: </strong></label>
                    <input type="text" class="form-control" name="id_Inventario" id="id_Inventario" required />
                </div>
                <div class="mb-3">
                    <label for="id_Marca" class="form-label"> <strong> id_Marca: </strong></label>
                    <input type="text" class="form-control" name="id_Marca" id="id_Marca" required />
                </div>
                <div class="mb-3">
                    <label for="id_Categoria" class="form-label"> <strong> id_Categoria: </strong></label>
                    <input type="text" class="form-control" name="id_Categoria" id="id_Categoria" required />
                </div>

                <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el Producto?')" /><br><br>
            </form>

            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarProductos" class="btn btn-secondary">Regresar</a>
            </div>            

        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
