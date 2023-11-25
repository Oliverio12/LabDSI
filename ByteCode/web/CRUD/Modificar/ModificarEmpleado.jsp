<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Empleado</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>   
        <!-- Contenido de tu página -->
        <div class="container mt-4 mb-5 p-4 border">
            <h1 class="display-4">Modificar empleado</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarEmpleado">
                <div class="mb-3">
                    <label for="ID_Empleado" class="form-label">ID Empleado:</label>
                    <input type="text" class="form-control" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" readonly />
                </div>
                <div class="mb-3">
                    <label for="DUI_Empleado" class="form-label">DUI:</label>
                    <input type="text" class="form-control" name="DUI_Empleado" id="DUI_Empleado" value="${param.DUI_Empleado}" required />
                </div>
                <div class="mb-3">
                    <label for="ISSS_Empleado" class="form-label">Número de afiliado ISSS:</label>
                    <input type="text" class="form-control" name="ISSS_Empleado" id="ISSS_Empleado" value="${param.ISSS_Empleado}" required />
                </div>
                <div class="mb-3">
                    <label for="nombresEmpleado" class="form-label">Nombres:</label>
                    <input type="text" class="form-control" name="nombresEmpleado" id="nombresEmpleado" value="${param.nombresEmpleado}" required />
                </div>
                <div class="mb-3">
                    <label for="apellidosEmpleado" class="form-label">Apellidos:</label>
                    <input type="text" class="form-control" name="apellidosEmpleado" id="apellidosEmpleado" value="${param.apellidosEmpleado}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaNacEmpleado" class="form-label">Fecha de nacimiento:</label>
                    <input type="date" class="form-control" name="fechaNacEmpleado" id="fechaNacEmpleado" value="${param.fechaNacEmpleado}" required />
                </div>
                <div class="mb-3">
                    <label for="telefonoEmpleado" class="form-label">Teléfono:</label>
                    <input type="text" class="form-control" name="telefonoEmpleado" id="telefonoEmpleado" value="${param.telefonoEmpleado}" required />
                </div>
                <div class="mb-3">
                    <label for="correo" class="form-label">Correo:</label>
                    <input type="email" class="form-control" name="correo" id="correo" value="${param.correo}" required />
                </div>
                <div class="mb-3">
                    <label for="ID_Cargo" class="form-label">ID Cargo:</label>
                    <input type="text" class="form-control" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" required />
                </div>
                <div class="mb-3">
                    <label for="ID_Direccion" class="form-label">ID Dirección:</label>
                    <input type="text" class="form-control" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required />
                </div>

                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el empleado?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarEmpleados" class="btn btn-secondary">Regresar</a>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>    
</body>
</html>
