<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Usuarios</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Usuarios</h1>
            <h2>Listado de Usuarios</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarUsuario">Agregar Usuario</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Usuario</th>
                        <th>Nombres Empleado</th>
                        <th>Rol</th>
                        <th>Usuario</th>
                        <th>Clave</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaUsuarios}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Usuario}" /></td>
                            <!--<td><c:out value="${item.id_Empleado}" /></td>-->
                            <td><c:out value="${item.nombreCompleto}" /></td>
                            <!--<td><c:out value="${item.id_Rol}" /></td>-->
                            <td><c:out value="${item.nombreRol}" /></td>
                            <td><c:out value="${item.usuario}" /></td>
                            <td><c:out value="${item.clave}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarUsuario.jsp">
                                    <input type="hidden" name="id_Usuario" value="${item.id_Usuario}" />
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarUsuario.jsp">
                                    <input type="hidden" name="id_Usuario" value="${item.id_Usuario}" />
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />                                    
                                    <input type="hidden" name="id_Rol" value="${item.id_Rol}" />                                    
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <input type="hidden" name="clave" value="${item.clave}" />             
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
