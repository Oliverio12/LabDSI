<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Compra</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Compra</h1>
            <h2>Listado de Compra</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCompra">Agregar Compra</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Compra</th>
                        <th>Proveedor</th>
                        <th>Nombre Compra</th>
                        <th>Fecha Compra</th>
                        <th>Total</th>
                        <th>Estado</th>
                        <th>Empleado</th>
                        <th>Descripcion</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaCompra}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Compra}" /></td>
                            <td><c:out value="${item.proveedor}" /></td>
                            <td><c:out value="${item.nombreCompra}" /></td>
                            <td><c:out value="${item.fecha_Compra}" /></td>
                            <td><c:out value="${item.total}" /></td>
                            <td><c:out value="${item.estado}" /></td>
                            <!--<td><c:out value="${item.id_Empleado}" /></td>-->
                            <td><c:out value="${item.empleado}" /></td>
                            <td><c:out value="${item.descripcionCompra}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCompra.jsp">
                                    <input type="hidden" name="id_Compra" value="${item.id_Compra}" />
                                    <input type="hidden" name="proveedor" value="${item.proveedor}" />             
                                    <input type="hidden" name="nombreCompra" value="${item.nombreCompra}" />             
                                    <input type="hidden" name="fecha_Compra" value="${item.fecha_Compra}" />             
                                    <input type="hidden" name="total" value="${item.total}" />             
                                    <input type="hidden" name="estado" value="${item.estado}" />             
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />             
                                    <input type="hidden" name="empleado" value="${item.empleado}" />             
                                    <input type="hidden" name="descripcionCompra" value="${item.descripcionCompra}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCompra.jsp">
                                    <input type="hidden" name="id_Compra" value="${item.id_Compra}" />
                                    <input type="hidden" name="proveedor" value="${item.proveedor}" />             
                                    <input type="hidden" name="nombreCompra" value="${item.nombreCompra}" />             
                                    <input type="hidden" name="fecha_Compra" value="${item.fecha_Compra}" />             
                                    <input type="hidden" name="total" value="${item.total}" />             
                                    <input type="hidden" name="estado" value="${item.estado}" />             
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />             
                                    <input type="hidden" name="empleado" value="${item.empleado}" />             
                                    <input type="hidden" name="descripcionCompra" value="${item.descripcionCompra}" />             
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
