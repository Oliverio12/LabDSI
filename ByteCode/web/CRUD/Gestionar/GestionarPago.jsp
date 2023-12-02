<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar pago</title>
        <style> body {
                font-family: 'Poppins', sans-serif;
                margin-top: 50px;
            }

            .container {
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }


            .btn-primary,
            .btn-warning,
            .btn-danger {
                width: 150px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .btn-warning:hover {
                background-color: #d39e00;
                border-color: #d39e00;
            }

            .btn-danger:hover {
                background-color: #bd2130;
                border-color: #bd2130;
            }


            .card-body {
                text-align: center;
            }

            .action-buttons {
                margin-top: 10px;
            }</style>
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
            <div class="row">
                <c:forEach items="${listaPagos}" var="item">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <strong>ID Pago: <c:out value="${item.id_Pago}" /></strong> 
                            </div>
                            <div class="card-body">

                                <p class="card-title">Metodo Pago: <c:out value="${item.metodoPago}" /></p>
                                <p class="card-title">Monto: <c:out value="${item.monto}" /></p>
                                <p class="card-title">Fecha de pago: <c:out value="${item.fechaPago}" /></p>
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarPago.jsp">
                                    <input type="hidden" name="id_Pago" value="${item.id_Pago}" />
                                    <input type="hidden" name="id_MetodoPago" value="${item.id_MetodoPago}" />
                                    <input type="hidden" name="metodoPago" value="${item.metodoPago}" />
                                    <input type="hidden" name="monto" value="${item.monto}" />
                                    <input type="hidden" name="fechaPago" value="${item.fechaPago}" />
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
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div>
            <%@include file="footer.html" %>
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
