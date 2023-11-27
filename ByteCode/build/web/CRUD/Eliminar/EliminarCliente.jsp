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

        <form method="POST" action="/ByteCode/ServletPrincipal?accion=EliminarCliente">
            <div>
                <label>ID Cliente ${param.id_Cliente}</label><br>
                <label>Nombres: ${param.nombresCliente}</label><br>
                <label>Apellidos: ${param.apellidosCliente}</label><br>
                <label>Dui:${param.duiCliente}</label><br>
                <label>Telefono:${param.telefono}</label><br>
                <label>Correo:${param.correo}</label><br>
                <label>ID Direccion:${param.id_Direccion}</label><br>
                <label>Usuario:${param.usuario}</label><br>
                <label>Clave:${param.clave}</label><br>
                <label>Fecha de registro ${param.fechaRegistro}</label><br>
                
                <input type="hidden" name="id_Cliente" id="id_Cliente" value="${param.id_Cliente}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Cargo?')" /><br><br>
            </div>
            <div>
                <a href="/ByteCode/?accion=GestionarClientes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>