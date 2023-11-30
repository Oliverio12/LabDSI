<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Carrito</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Carrito</h1>
            <h2>Listado de Carrito</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCarrito">Agregar Carrito</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Carrito</th>
                        <th>Producto</th>
                        <th>Venta</th>
                        <th>Cantidad</th>
                        <th>Fecha Agregado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaCarrito}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Carrito}" /></td>
                            <!--<td><c:out value="${item.id_Producto}" /></td>-->
                            <td><c:out value="${item.producto}" /></td>
                            <!--<td><c:out value="${item.id_Venta}" />   </td>-->
                            <td><c:out value="${item.venta}" /></td>
                            <td><c:out value="${item.cantidad}" /></td>
                            <td><c:out value="${item.fechaAgregado}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCarrito.jsp">
                                    <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />             
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />             
                                    <input type="hidden" name="venta" value="${item.venta}" />
                                    <input type="hidden" name="cantidad" value="${item.cantidad}" />             
                                    <input type="hidden" name="fechaAgregado" value="${item.fechaAgregado}" />              
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCarrito.jsp">
                                    <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />             
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />             
                                    <input type="hidden" name="venta" value="${item.venta}" />
                                    <input type="hidden" name="cantidad" value="${item.cantidad}" />             
                                    <input type="hidden" name="fechaAgregado" value="${item.fechaAgregado}" />             
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
