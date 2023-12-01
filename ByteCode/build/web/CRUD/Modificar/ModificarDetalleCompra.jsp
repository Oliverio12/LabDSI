<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Detalle Compra</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Detalle Compra</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarDetalleCompra">
                <div class="mb-3">
                    <label for="id_DetalleCompra" class="form-label">ID DetalleCompra</label>
                    <input type="text" class="form-control" name="id_DetalleCompra" id="id_DetalleCompra" value="${param.id_DetalleCompra}"  readonly/>
                </div>
                <div class="mb-3">
                    <label for="id_Compra" class="form-label">ID Compra</label>
                    <input type="text" class="form-control" name="id_Compra" id="id_Compra" value="${param.id_Compra}" required />
                </div>
                <div class="mb-3">
                    <label for="compra" class="form-label">Compra</label>
                    <input type="text" class="form-control" name="compra" id="compra" value="${param.compra}" readonly />
                </div>
                <div class="mb-3">
                    <label for="cantidad" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" id="cantidad" value="${param.cantidad}" required oninput="calcularTotal()" />
                </div>
                <div class="mb-3">
                    <label for="precioUnitario" class="form-label">Precio Unitario</label>
                    <input type="text" class="form-control" name="precioUnitario" id="precioUnitario" value="${param.precioUnitario}" required  oninput="calcularTotal()"/>
                </div>
                <div class="mb-3">
                    <label for="estadoCompra" class="form-label">Estado Compra</label>
                    <input type="text" class="form-control" name="estadoCompra" id="estadoCompra" value="${param.estadoCompra}" required />
                </div>
                <div class="mb-3">
                    <label for="total" class="form-label">Total</label>
                    <input type="text" class="form-control" name="total" id="total" value="${param.total}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el detalle de la compra?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarDetalleCompra" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <script>
            function calcularTotal() {
                // Obtener los valores de cantidad y precio unitario
                var cantidad = document.getElementById('cantidad').value;
                var precioUnitario = document.getElementById('precioUnitario').value;

                // Verificar si ambos campos tienen valores
                if (cantidad !== "" && precioUnitario !== "") {
                    // Calcular el total
                    var total = cantidad * precioUnitario;

                    // Mostrar el total en el campo correspondiente
                    document.getElementById('total').value = total.toFixed(2);
                } else {
                    // Si falta algún valor, mostrar un total vacío
                    document.getElementById('total').value = 0.00;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>