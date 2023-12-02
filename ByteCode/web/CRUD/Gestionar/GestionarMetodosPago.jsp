<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar Métodos de Pago</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <h1 class="mt-5">Gestión de Métodos de Pago</h1>
        <h2>Listado de Métodos de Pago</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <div>
            <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>
            <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarMetodosPago">Agregar Métodos de Pago</a><br><br>
        </div>

        <div class="row">
            <c:forEach items="${listaMetodosPago}" var="item">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-header">
                            ID Método Pago: ${item.idMetodoPago}
                        </div>
                        <div class="card-body">
                            <p class="card-text">Tipo de Pago: ${item.metodo}</p>
                            <div class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarMetodosPago.jsp">
                                    <input type="hidden" name="idMetodoPago" value="${item.idMetodoPago}" />
                                    <input type="hidden" name="metodo" value="${item.metodo}" />
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarMetodosPago.jsp">
                                    <input type="hidden" name="idMetodoPago" value="${item.idMetodoPago}" />
                                    <input type="hidden" name="metodo" value="${item.metodo}" />
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                            </div>
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
