<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cliente</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>   
        <!-- Contenido de tu página -->
        <div class="container mt-4 mb-5 p-4 border">
            <h1 class="display-4">Modificar Cliente</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarCliente">
                <div class="mb-3">
                    <label for="id_Cliente" class="form-label">ID Cliente:</label>
                    <input type="text" class="form-control" name="id_Cliente" id="id_Cliente" value="${param.id_Cliente}" readonly />
                </div>
                <div class="mb-3">
                    <label for="nombresCliente" class="form-label">Nombre: </label>
                    <input type="text" class="form-control" name="nombresCliente" id="nombresCliente" value="${param.nombresCliente}" required />
                </div>
                <div class="mb-3">
                    <label for="apellidosCliente" class="form-label">Apellidos: </label>
                    <input type="text" class="form-control" name="apellidosCliente" id="apellidosCliente" value="${param.apellidosCliente}" required />
                </div>
                <div class="mb-3">
                    <label for="duiCliente" class="form-label">DUI:</label>
                    <input type="text" class="form-control" name="duiCliente" id="duiCliente" value="${param.duiCliente}" required />
                </div>
                <div class="mb-3">
                    <label for="telefono" class="form-label">Telefono:</label>
                    <input type="text" class="form-control" name="telefono" id="telefono" value="${param.telefono}" required />
                </div>
                <div class="mb-3">
                    <label for="correo" class="form-label">Correo: </label>
                    <input type="email" class="form-control" name="correo" id="correo" value="${param.correo}" required />
                </div>
                <div class="mb-3">
                    <label for="id_Direccion" class="form-label">ID Direccion</label>
                    <input type="text" class="form-control" name="id_Direccion" id="id_Direccion" value="${param.id_Direccion}" required />
                </div>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario:</label>
                    <input type="text" class="form-control" name="usuario" id="usuario" value="${param.usuario}" required />
                </div>
                <div class="mb-3">
                    <label for="clave" class="form-label">Clave:</label>
                    <input type="text" class="form-control" name="clave" id="clave" value="${param.clave}" required />
                </div>
                

                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el cliente?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarClientes" class="btn btn-secondary">Regresar</a>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>    
</body>
</html>
