<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Usuario</title>
    </head>
    <body>
        <h1>Eliminar Usuario</h1>

        <form method="POST" action="/ByteCode/ServletPrincipal?accion=EliminarUsuario">
            <div>
                <label>ID Usuario ${param.id_Usuario}</label><br>
                <label>ID Empleado ${param.id_Empleado}</label><br>
                <label>ID Rol: ${param.id_Rol}</label><br>
                <label>Usuario: ${param.usuario}</label><br>
                <label>Clave ${param.clave}</label><br>
                
                <input type="hidden" name="id_Usuario" id="id_Usuario" value="${param.id_Usuario}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Cargo?')" /><br><br>
            </div>
            <div>
                <a href="/ByteCode/?accion=GestionarUsuarios">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>