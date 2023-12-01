<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cargo</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Cargo</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarDescuento">
                <div class="mb-3">
                    <label for="id_Descuento" class="form-label">ID Descuento</label>
                    <input type="text" class="form-control" name="id_Descuento" id="id_Descuento" value="${param.id_Descuento}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Producto" class="form-label">ID Producto</label>
                    <input type="text" class="form-control" name="id_Producto" id="id_Producto" value="${param.id_Producto}" required />
                </div>
                <div class="mb-3">
                    <label for="producto" class="form-label">Producto</label>
                    <input type="text" class="form-control" name="producto" id="producto" value="${param.producto}" readonly />
                </div>
                <div class="mb-3">
                    <label for="porcentajeDescuento" class="form-label">Descuento %%</label>
                    <input type="text" class="form-control" name="porcentajeDescuento" id="porcentajeDescuento" value="${param.porcentajeDescuento}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaInicio" class="form-label">Inicio</label>
                    <input type="date" class="form-control" name="fechaInicio" id="fechaInicio" value="${param.fechaInicio}" required />
                </div>
                <div class="mb-3">
                    <label for="fechaFinal" class="form-label">Final</label>
                    <input type="date" class="form-control" name="fechaFinal" id="fechaFinal" value="${param.fechaFinal}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el Descuento?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarDescuento" class="btn btn-secondary">Regresar</a>
            </div>
        </div>

        <script>
            document.getElementById('fechaInicio').addEventListener('change', function () {
                validarFechas();
            });

            document.getElementById('fechaFinal').addEventListener('change', function () {
                validarFechas();
            });

            function validarFechas() {
                var fechaInicio = new Date(document.getElementById('fechaInicio').value);
                var fechaFinal = new Date(document.getElementById('fechaFinal').value);

                if (isNaN(fechaInicio) || isNaN(fechaFinal)) {
                    return;
                }

                if (fechaInicio > fechaFinal) {
                    alert('La fecha de inicio no puede ser mayor que la fecha final.');
                    document.getElementById('fechaInicio').value = '';
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>