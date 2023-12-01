<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Grupo</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Grupo</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarGrupo">
                <div class="mb-3">
                    <label for="id_Grupo" class="form-label">ID Grupo</label>
                    <input type="text" class="form-control" name="id_Grupo" id="id_Grupo" value="${param.id_Grupo}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Empleado" class="form-label">ID Empleado</label>
                    <input type="text" class="form-control" name="id_Empleado" id="id_Empleado" value="${param.id_Empleado}" required />
                </div>
                <div class="mb-3">
                    <label for="empleado" class="form-label">Empleado</label>
                    <input type="text" class="form-control" name="empleado" id="empleado" value="${param.empleado}" readonly />
                </div>
                <div class="mb-3">
                    <label for="turno" class="form-label">Turno</label>
                    <input type="text" class="form-control" name="turno" id="turno" value="${param.turno}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Grupo?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarGrupos" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>