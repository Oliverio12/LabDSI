<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Detalle Venta</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>   
        <div class="container mt-4 border p-4">
            <h1 class="display-4">Modificar Detalle Venta</h1>
            <form method="POST" action="/ByteCode/ServletPrincipal?accion=ModificarDetalleVenta">
                <div class="mb-3">
                    <label for="id_DetalleVenta" class="form-label">ID DetalleVenta</label>
                    <input type="text" class="form-control" name="id_DetalleVenta" id="id_DetalleVenta" value="${param.id_DetalleVenta}" readonly/>
                </div>
                <div class="mb-3">
                    <label for="id_Venta" class="form-label">id_Venta</label>
                    <input type="text" class="form-control" name="id_Venta" id="id_Venta" value="${param.id_Venta}" required />
                </div>
                <div class="mb-3">
                    <label for="venta" class="form-label">venta</label>
                    <input type="text" class="form-control" name="venta" id="venta" value="${param.venta}" readonly />
                </div>
                <div class="mb-3">
                    <label for="id_Carrito" class="form-label">ID Carrito</label>
                    <input type="text" class="form-control" name="id_Carrito" id="id_Carrito" value="${param.id_Carrito}" required />
                </div>
                <div class="mb-3">
                    <label for="carrito" class="form-label">carrito</label>
                    <input type="text" class="form-control" name="carrito" id="carrito" value="${param.carrito}" readonly />
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
                    <label for="cantidad" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" id="cantidad" value="${param.cantidad}" required oninput="calcularTotal()"  />
                </div>
                <div class="mb-3">
                    <label for="precioUnitario" class="form-label">Precio Unitario</label>
                    <input type="text" class="form-control" name="precioUnitario" id="precioUnitario" value="${param.precioUnitario}" required oninput="calcularTotal()"  />
                </div>
                <div class="mb-3">
                    <label for="total" class="form-label">Total</label>
                    <input type="text" class="form-control" name="total" id="total" value="${param.total}" required />
                </div>
                <button type="submit" class="btn btn-primary" onclick="return confirm('¿Desea modificar el detalle de venta?')">Modificar</button>
            </form>
            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarDetalleVentas" class="btn btn-secondary">Regresar</a>
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