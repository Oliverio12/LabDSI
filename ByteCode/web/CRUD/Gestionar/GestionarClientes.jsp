<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Clientes</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Clientes</h1>
            <h2>Listado de Clientes</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCliente">Agregar Cliente</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Cliente</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Dui</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Id DIreccion</th>
                        <th>Usuario</th>
                        <th>Clave</th>
                        <th>Fecha de Registro</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaClientes}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Cliente}" /></td>
                            <td><c:out value="${item.nombresCliente}" /></td>
                            <td><c:out value="${item.apellidosCliente}" /></td>
                            <td><c:out value="${item.duiCliente}" /></td>
                            <td><c:out value="${item.telefono}" /></td>
                            <td><c:out value="${item.correo}" /></td>
                            <td><c:out value="${item.id_Direccion}" /></td>
                            <td><c:out value="${item.usuario}" /></td>
                            <td><c:out value="${item.clave}" /></td>
                            <td><c:out value="${item.fechaRegistro}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCliente.jsp">
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />
                                    <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCliente.jsp">
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />
                                    <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />             
                                    <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />             
                                    <input type="hidden" name="duiCliente" value="${item.duiCliente}" />             
                                    <input type="hidden" name="telefono" value="${item.telefono}" />             
                                    <input type="hidden" name="correo" value="${item.correo}" />             
                                    <input type="hidden" name="id_Direccion" value="${item.id_Direccion}" />             
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <input type="hidden" name="clave" value="${item.clave}" />             
                                    <input type="hidden" name="fechaRegistro" value="${item.fechaRegistro}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>            
            </table>
        </div>
        <script>
            function regresar() {
                window.location.href = "index.html";
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
