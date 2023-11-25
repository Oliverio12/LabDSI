<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuario</title>
        
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
 
    </head>
    <body>   
        <!-- Contenido de tu página -->
        <div class="container mt-4 mb-5 border p-4">
            <h1 class="display-4">Modificar Usuario</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarUsuario">
                <div class="mb-3">
                    <label for="id_Usuario" class="form-label">ID Usuario</label>
                    <input type="text" class="form-control" name="id_Usuario" id="id_Usuario" value="${param.id_Usuario}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Empleado" class="form-label">ID Empleado</label>
                    <input type="text" class="form-control" name="id_Empleado" id="id_Empleado" value="${param.id_Empleado}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Rol" class="form-label">ID Rol</label>
                    <input type="text" class="form-control" name="id_Rol" id="id_Rol" value="${param.id_Rol}" required />
                </div>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario:</label>
                    <input type="text" class="form-control" name="usuario" id="usuario" value="${param.usuario}" required />
                </div>
                <div class="mb-3">
                    <label for="clave" class="form-label">Clave:</label>
                    <input type="password" class="form-control" name="clave" id="clave" value="${param.clave}" required />
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Usuario?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarUsuarios" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>    

    </body>
</html>
