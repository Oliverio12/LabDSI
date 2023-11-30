<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Metodos de pago</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Ventas</h1>
            <h2>Listado de Ventas</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarVenta">Agregar Ventas</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Ventas</th>
                        <th>Cliente</th>
                        <th>Usuario Empleado</th>
                        <th>Pago</th>
                        <th>Fecha de Venta</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaVentas}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Venta}" /></td>
                            <!--<td><c:out value="${item.id_Cliente}" /></td>-->
                            <td><c:out value="${item.cliente}" /></td>
                            <!--<td><c:out value="${item.id_Usuario}" /></td>-->
                            <td><c:out value="${item.usuarioEmpleado}" /></td>
                            <!--<td><c:out value="${item.id_Pago}" /></td>-->
                            <td><c:out value="${item.pago}" /></td>
                            <td><c:out value="${item.fechaVenta}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarVenta.jsp">
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarVenta.jsp">
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />             
                                    <input type="hidden" name="cliente" value="${item.cliente}" />             
                                    <input type="hidden" name="id_Usuario" value="${item.id_Usuario}" />             
                                    <input type="hidden" name="usuarioEmpleado" value="${item.usuarioEmpleado}" />             
                                    <input type="hidden" name="id_Pago" value="${item.id_Pago}" />             
                                    <input type="hidden" name="pago" value="${item.pago}" />             
                                    <input type="hidden" name="fechaVenta" value="${item.fechaVenta}" />             
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
