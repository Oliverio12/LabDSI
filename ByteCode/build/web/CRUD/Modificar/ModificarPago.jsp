<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Pago</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Pago</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarPago">
                <div class="mb-3">
                    <label for="id_Pago" class="form-label">ID Pago</label>
                    <input type="text" class="form-control" name="id_Pago" id="id_Pago" value="${param.id_Pago}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_MetodoPago" class="form-label">ID MetodoPago</label>
                    <input type="text" class="form-control" name="id_MetodoPago" id="id_MetodoPago" value="${param.id_MetodoPago}" required />
                </div>
                <div class="mb-3">
                    <label for="metodoPago" class="form-label">Metodo Pago</label>
                    <input type="text" class="form-control" name="metodoPago" id="metodoPago" value="${param.metodoPago}" readonly/>
                </div>
                <div class="mb-3">
                    <label for="monto" class="form-label">monto</label>
                    <input type="text" class="form-control" name="monto" id="monto" value="${param.monto}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaPago" class="form-label">fechaPago</label>
                    <input type="date" class="form-control" name="fechaPago" id="fechaPago" value="${param.fechaPago}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Pago?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarPago" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>