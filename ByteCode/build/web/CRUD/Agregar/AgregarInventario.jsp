<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Inventario</title>
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
            <h1>Agregar nuevo Inventario</h1>

            <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarInventario">
                <div class="mb-3">
                    <label for="stock" class="form-label"> <strong>Stocks Recibidos:</strong></label>
                    <input type="text" class="form-control" name="stock" id="stock" required />
                    <label for="nombreProducto" class="form-label"> <strong> Nombre del Producto: </strong></label>
                    <input type="text" class="form-control" name="nombreProducto" id="nombreProducto" required />
                    <label for="descripcion" class="form-label"> <strong> Descripcion: </strong></label>
                    <input type="text" class="form-control" name="descripcion" id="descripcion" />
                    <label for="precio" class="form-label"> <strong>Precio: </strong></label>
                    <input type="number" step="0.01" min="0" class="form-control" name="precio" id="precio" required />
                    <label for="fechaAdquisicion" class="form-label"> <strong> Fecha de Adquisicion: </strong></label>
                    <input type="date" class="form-control" name="fechaAdquisicion" id="fechaAdquisicion" required />
                    <label for="fechaUltimaActualizacion" class="form-label"> <strong> Ultima Actualizacion: </strong></label>
                    <input type="date" class="form-control" name="fechaUltimaActualizacion" id="fechaUltimaActualizacion" required />
                    <label for="categoria" class="form-label"> <strong> Categoria </strong></label>
                    <input type="text" class="form-control" name="categoria" id="categoria" required />
                    <label for="proveedor" class="form-label"> <strong> Proveedor </strong></label>
                    <input type="text" class="form-control" name="proveedor" id="proveedor" required />
                </div>

                <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el Inventario?')" /><br><br>
            </form>

            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarInventario" class="btn btn-secondary">Regresar</a>
            </div>            

        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
