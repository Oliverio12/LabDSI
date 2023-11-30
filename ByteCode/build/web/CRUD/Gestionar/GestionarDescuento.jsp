<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Descuentos</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Descuentos</h1>
            <h2>Listado de Descuntos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarDescuento">Agregar Descuentos</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Descuntos</th>
                        <th>Producto</th>
                        <th>Porcentaje de Descuento</th>
                        <th>Inicio Descuento</th>
                        <th>Final Descuento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaDescuento}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Descuento}" /></td>
                            <!--<td><c:out value="${item.id_Producto}" /></td>-->
                            <td><c:out value="${item.producto}" /></td>
                            <td><c:out value="${item.porcentajeDescuento}" /></td>
                            <td><c:out value="${item.fechaInicio}" /></td>
                            <td><c:out value="${item.fechaFinal}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarDescuento.jsp">
                                    <input type="hidden" name="id_Descuento" value="${item.id_Descuento}" />
                                    <input type="hidden" name="porcentajeDescuento" value="${item.porcentajeDescuento}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarDescuento.jsp">
                                    <input type="hidden" name="id_Descuento" value="${item.id_Descuento}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="porcentajeDescuento" value="${item.porcentajeDescuento}" />
                                    <input type="hidden" name="fechaInicio" value="${item.fechaInicio}" />
                                    <input type="hidden" name="fechaFinal" value="${item.fechaFinal}" />             
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
