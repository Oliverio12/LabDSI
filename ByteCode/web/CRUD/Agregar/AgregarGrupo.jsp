<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Grupo</title>
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
            <h1>Agregar nuevo Grupo</h1>

            <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarGrupo">
                <div class="mb-3">
                    <label for="id_Empleado" class="form-label"> <strong> ID Empleado: </strong></label>
                    <input type="text" class="form-control" name="id_Empleado" id="id_Empleado" required />
                </div>
                <div class="mb-3">
                    <label for="turno" class="form-label"> <strong> Turno: </strong></label>
                    <input type="text" class="form-control" name="turno" id="turno" required />
                </div>
                

                <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el Grupo?')" /><br><br>
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
