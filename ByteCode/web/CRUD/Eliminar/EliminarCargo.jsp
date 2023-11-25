<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cargo</title>
    </head>
    <body>
        <h1>Eliminar Cargo</h1>

        <form method="POST" action="/ByteCode/ServletPrincipal?accion=EliminarCargos">
            <div>
                <label>ID Empleado: ${param.id_Cargo}</label><br>
                <label>Cargo ${param.cargo}</label><br>
                
                <input type="hidden" name="id_Cargo" id="id_Cargo" value="${param.id_Cargo}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Cargo?')" /><br><br>
            </div>
            <div>
                <a href="/ByteCode/?accion=GestionarCargos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>