<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Empleados</h1>
            <h2>Listado de Empleados</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCargo">Agregar Empleado</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Empleado</th>
                        <th>Dui Empleado</th>
                        <th>Iss Empleado</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha Nacimiento</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaEmpleados}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Empleado}" /></td>
                            <td><c:out value="${item.dui_Empleado}" /></td>
                            <td><c:out value="${item.isss_Empleado}" /></td>
                            <td><c:out value="${item.nombresEmpleado}" /></td>
                            <td><c:out value="${item.apellidosEmpleado}" /></td>
                            <td><c:out value="${item.fechaNacEmpleado}" /></td>
                            <td><c:out value="${item.telefono}" /></td>
                            <td><c:out value="${item.correo}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/OpcionesUsuario/Modificar/ModificarCargo.jsp">
                                    <input type="hidden" name="Id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/OpcionesUsuario/Eliminar/EliminarCargo.jsp">
                                    <input type="hidden" name="Id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />             
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
                window.history.back();
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </body>
</html>
