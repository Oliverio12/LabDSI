<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Productos</h1>
            <h2>Listado de Productos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCargo">Agregar Productos</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Productos</th>
                        <th>Producto</th>
                        <th>Descripcion</th>
                        <th>Precio</th>
                        <th>ID Inventario</th>
                        <th>ID Marca</th>
                        <th>ID Categoria</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaProductos}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Producto}" /></td>
                            <td><c:out value="${item.nombreProducto}" /></td>
                            <td><c:out value="${item.descripcion}" /></td>
                            <td><c:out value="${item.precio}" /></td>
                            <td><c:out value="${item.id_Inventario}" /></td>
                            <td><c:out value="${item.id_Marca}" /></td>
                            <td><c:out value="${item.id_Categoria}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/OpcionesUsuario/Modificar/ModificarCargo.jsp">
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/OpcionesUsuario/Eliminar/EliminarCargo.jsp">
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />             
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
