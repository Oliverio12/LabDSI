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
            <h1 class="mt-5">Gestión de pago</h1>
            <h2>Listado de pagos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarPago">Agregar pago</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Pago</th>
                        <th>Metodo Pago</th>
                        <th>Monto</th>
                        <th>Fecha de pago</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaPagos}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Pago}" /></td>
                            <!--<td><c:out value="${item.id_MetodoPago}" /></td>-->
                            <td><c:out value="${item.metodoPago}" /></td>
                            <td><c:out value="${item.monto}" /></td>
                            <td><c:out value="${item.fechaPago}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarPago.jsp">
                                    <input type="hidden" name="id_Pago" value="${item.id_Pago}" />
                                    <input type="hidden" name="id_MetodoPago" value="${item.id_MetodoPago}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarPago.jsp">
                                    <input type="hidden" name="id_Pago" value="${item.id_Pago}" />
                                    <input type="hidden" name="id_MetodoPago" value="${item.id_MetodoPago}" />             
                                    <input type="hidden" name="metodoPago" value="${item.metodoPago}" />             
                                    <input type="hidden" name="monto" value="${item.monto}" />             
                                    <input type="hidden" name="fechaPago" value="${item.fechaPago}" />             
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
