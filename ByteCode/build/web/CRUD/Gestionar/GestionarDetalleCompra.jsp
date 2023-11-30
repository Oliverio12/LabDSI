<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Detalle Compra</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Detalle Compra</h1>
            <h2>Listado de Compra</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarDetalleCompra">Agregar Detalle Compra</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Detlle Compra</th>
                        <th>Compra</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Estado de la Compra</th>
                        <th>Total</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaDetalleCompra}" var="item">
                        <tr>
                            <td><c:out value="${item.id_DetalleCompra}" /></td>
                            <!--<td><c:out value="${item.id_Compra}" /></td>-->
                            <td><c:out value="${item.compra}" /></td>
                            <td><c:out value="${item.cantidad}" /></td>
                            <td><c:out value="${item.precioUnitario}" /></td>
                            <td><c:out value="${item.estadoCompra}" /></td>
                            <td><c:out value="${item.total}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarDetalleCompra.jsp">
                                    <input type="hidden" name="id_DetalleCompra" value="${item.id_DetalleCompra}" />
                                    <input type="hidden" name="id_Compra" value="${item.id_Compra}" />             
                                    <input type="hidden" name="compra" value="${item.compra}" />             
                                    <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />             
                                    <input type="hidden" name="estadoCompra" value="${item.estadoCompra}" />             
                                    <input type="hidden" name="total" value="${item.total}" />                 
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarDetalleCompra.jsp">
                                    <input type="hidden" name="id_DetalleCompra" value="${item.id_DetalleCompra}" />
                                    <input type="hidden" name="id_Compra" value="${item.id_Compra}" />             
                                    <input type="hidden" name="compra" value="${item.compra}" />             
                                    <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />             
                                    <input type="hidden" name="estadoCompra" value="${item.estadoCompra}" />             
                                    <input type="hidden" name="total" value="${item.total}" />             
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
