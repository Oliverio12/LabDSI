<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Eliminar Empleado</title>
    </head>
    <body>

        <div class="container mt-5 mb-5 border p-4">
            <h1 class="mb-4">Eliminar empleado</h1>

            <form method="POST" action="/ByteCode/ServletPrincipal?accion=EliminarEmpleado">
                <div class="form-group">
                    <label class="font-weight-bold">ID Empleado:</label> ${param.id_Empleado}<br>
                    <label class="font-weight-bold">DUI:</label> ${param.dui_Empleado}<br>
                    <label class="font-weight-bold">Número de afiliado ISSS:</label> ${param.isss_Empleado}<br>
                    <label class="font-weight-bold">Nombres:</label> ${param.nombresEmpleado}<br>
                    <label class="font-weight-bold">Apellidos:</label> ${param.apellidosEmpleado}<br>
                    <label class="font-weight-bold">Fecha de nacimiento:</label> ${param.fechaNacEmpleado}<br>
                    <label class="font-weight-bold">Teléfono:</label> ${param.telefono}<br>
                    <label class="font-weight-bold">Correo:</label> ${param.correo}<br>
                    <label class="font-weight-bold">Cargo:</label> ${param.id_Cargo}<br>
                    <label class="font-weight-bold">Dirección:</label> ${param.id_Direccion}
                    <input type="hidden" name="ID_Empleado" id="ID_Empleado" value="${param.id_Empleado}" /><br><br>
                    <button type="submit" class="btn btn-danger" onclick="return confirm('¿Desea eliminar el empleado?')">Eliminar</button><br><br>
                </div>
            </form>

            <div>
                <a class="btn btn-secondary" href="/ByteCode/?accion=GestionarEmpleados">Regresar</a><br><br>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
