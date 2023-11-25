<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Empleado</title>

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

                <h1 class="mb-4">Agregar nuevo empleado</h1>

                <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarEmpleado">
                    <div class="form-group">
                        <label for="DUI_Empleado">DUI:</label>
                        <input type="text" class="form-control" name="DUI_Empleado" id="DUI_Empleado" required>
                    </div>

                    <div class="form-group">
                        <label for="ISSS_Empleado">Número de afiliado ISSS:</label>
                        <input type="text" class="form-control" name="ISSS_Empleado" id="ISSS_Empleado" required>
                    </div>

                    <div class="form-group">
                        <label for="nombresEmpleado">Nombres:</label>
                        <input type="text" class="form-control" name="nombresEmpleado" id="nombresEmpleado" required>
                    </div>

                    <div class="form-group">
                        <label for="apellidosEmpleado">Apellidos:</label>
                        <input type="text" class="form-control" name="apellidosEmpleado" id="apellidosEmpleado" required>
                    </div>

                    <div class="form-group">
                        <label for="fechaNacEmpleado">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" name="fechaNacEmpleado" id="fechaNacEmpleado" required>
                    </div>

                    <div class="form-group">
                        <label for="telefonoEmpleado">Teléfono:</label>
                        <input type="text" class="form-control" name="telefonoEmpleado" id="telefonoEmpleado" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" name="correo" id="correo" required>
                    </div>

                    <div class="form-group">
                        <label for="ID_Cargo">ID Cargo:</label>
                        <input type="text" class="form-control" name="ID_Cargo" id="ID_Cargo" required>
                    </div>

                    <div class="form-group">
                        <label for="ID_Direccion">ID Dirección:</label>
                        <input type="text" class="form-control" name="ID_Direccion" id="ID_Direccion" required>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el empleado?')">
                    </div>
                </form>

                <div class="mt-4">
                    <a href="/ByteCode/?accion=GestionarEmpleados" class="btn btn-secondary">Regresar</a>
                </div>
            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
