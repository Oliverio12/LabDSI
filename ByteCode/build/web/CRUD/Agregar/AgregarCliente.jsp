<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cliente</title>

        <!-- Agregar Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>

        <div class="container mt-5 mb-5">
            <div class="container mt-4 border p-4">
                <c:if test="${exito!=null}">
                    <c:if test="${exito}">
                        <p class="alert alert-success"><strong>La información se guardó correctamente</strong></p>
                    </c:if>
                    <c:if test="${!exito}">
                        <p class="alert alert-danger"><strong>No se guardó la información</strong></p>
                    </c:if>
                </c:if>

                <h1 class="mb-4">Agregar nuevo Cliente</h1>

                <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarCliente">
                    <div class="form-group">
                        <label for="nombresCliente">Nombres: </label>
                        <input type="text" class="form-control" name="nombresCliente" id="nombresCliente" required>
                    </div>

                    <div class="form-group">
                        <label for="apellidosCliente">Apellidos: </label>
                        <input type="text" class="form-control" name="apellidosCliente" id="apellidosCliente" required>
                    </div>

                    <div class="form-group">
                        <label for="duiCliente">DUI: </label>
                        <input type="text" class="form-control" name="duiCliente" id="duiCliente" required>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Telefono: </label>
                        <input type="text" class="form-control" name="telefono" id="telefono" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo: </label>
                        <input type="email" class="form-control" name="correo" id="correo" required>
                    </div>

                    <div class="form-group">
                        <label for="id_Direccion">Id Direccion:</label>
                        <input type="text" class="form-control" name="id_Direccion" id="id_Direccion" required>
                    </div>

                    <div class="form-group">
                        <label for="usuario">Usuario: </label>
                        <input type="text" class="form-control" name="usuario" id="usuario" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="clave">Clave: </label>
                        <input type="password" class="form-control" name="clave" id="clave" required>
                    </div>
                    
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el Cliente?')">
                    </div>
                </form>

                <div class="mt-4">
                    <a href="/ByteCode/?accion=GestionarClientes" class="btn btn-secondary">Regresar</a>
                </div>
            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
