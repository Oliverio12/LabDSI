
--Vista de Direcciones

CREATE VIEW DireccionCompleta AS
SELECT
	D.Id_Direccion,
    D.Linea1,
    D.Linea2,
    D.CodigoPostal,
    Dist.Distrito,
    M.Municipio,
    Dep.Departamento,
    Dep.Pais
FROM Departamento.Direcciones D
JOIN Departamento.Distritos Dist ON D.Id_Distrito = Dist.Id_Distrito
JOIN Departamento.Municipios M ON Dist.Id_Municipio = M.Id_Municipio
JOIN Departamento.Departamentos Dep ON M.Id_Departamento = Dep.Id_Departamento;
go
select * from DireccionCompleta

--Vista de Empleados
CREATE VIEW VistaEmpleadoDireccion AS
SELECT
    E.Id_Empleado,
    E.DUI_Empleado,
    E.ISSS_Empleado,
    E.NombresEmpleado,
    E.ApellidosEmpleado,
    E.FechaNacEmpleado,
    E.Telefono,
    E.Correo,
    E.Id_Cargo,
    C.Cargo as CargoEmpleado,
    E.Id_Direccion,
    CONCAT(
        DC.Linea1, ', ',
        DC.Linea2, ', ',
        DC.CodigoPostal, ', ',
        DC.Distrito, ', ',
        DC.Municipio, ', ',
        DC.Departamento, ', ',
        DC.Pais, ', ',
        CAST(DC.CodigoPostal as char(5))
    ) as Direccion
FROM Persona.Empleados E
JOIN Persona.Cargos C ON E.Id_Cargo = C.Id_Cargo
JOIN DireccionCompleta DC ON E.Id_Direccion = DC.Id_Direccion;
go

select * from  VistaEmpleadoDireccion

--Vista de Usuarios
CREATE VIEW VistaUsuarios AS
SELECT
    U.Id_Usuario,
    U.Id_Empleado,
    CONCAT(E.NombresEmpleado, ', ', E.ApellidosEmpleado) AS NombreCompleto,
    E.Id_Cargo,
    U.Id_Rol,
    R.NombreRol,
    U.Usuario,
    U.Clave
FROM Rol.Usuarios U
JOIN Rol.Roles R ON U.Id_Rol = R.Id_Rol
JOIN Persona.Empleados E ON U.Id_Empleado = E.Id_Empleado;

select * from VistaUsuarios

--Vista de Clientes
CREATE VIEW VistaClientesDireccion AS
SELECT
    C.Id_Cliente,
    C.NombresCliente,
    C.ApellidosCliente,
    C.DUI_Cliente,
    C.Telefono,
    C.Correo,
    C.Id_Direccion,
    CONCAT(
        DC.Linea1, ', ',
        DC.Linea2, ', ',
        DC.CodigoPostal, ', ',
        DC.Distrito, ', ',
        DC.Municipio, ', ',
        DC.Departamento, ', ',
        DC.Pais, ', ',
        CAST(DC.CodigoPostal as char(5))
    ) as Direccion,
    C.Usuario,
    C.Clave
FROM Cliente.Clientes C
JOIN DireccionCompleta DC ON C.Id_Direccion = DC.Id_Direccion;

Select * from VistaClientesDireccion


--Vista de Inventario
CREATE VIEW VistaInventario
AS
SELECT
    Id_Inventario,
    Stock,
    Nombre_producto,
    Descripcion,
    Precio,
    Fecha_adquisicion,
    Fecha_ultima_actualizacion,
    Categoria,
    Proveedor
FROM
    Productos.Inventario;
go
	
select * from VistaInventario


--Vista de Productos

CREATE VIEW VistaProductoCompleta
AS
SELECT
    P.Id_Producto,
    P.NombreProducto,
    P.Descripcion AS DescripcionProducto,
    P.Precio,
	P.Id_Inventario,
	CONCAT(
    'Cantidad: ',I.Stock , ',   ' ,
    I.Nombre_producto,', ',
    I.Descripcion,', ',
    I.Fecha_adquisicion,', ',
    I.Fecha_ultima_actualizacion,', ',
    I.Categoria,', ',
    I.Proveedor) as Inventario,
	P.Id_Marca,
	CONCAT(
	'Marca: ',
    M.NombreMarca) as Marca,
	P.Id_Categoria,
	CONCAT(
	'Categoria: ',
    C.NombreCategoria) as Categoria
FROM
    Productos.Producto P
    INNER JOIN Productos.Inventario I ON P.Id_Inventario = I.Id_Inventario
    INNER JOIN Productos.Marca M ON P.Id_Marca = M.Id_Marca
    INNER JOIN Productos.Categoria C ON P.Id_Categoria = C.Id_Categoria;
go


CREATE VIEW VistaProductoConDescuento
AS
SELECT
	D.Id_Descuento,
    D.Id_Producto,
	CONCAT( 
    P.NombreProducto,', ',
    P.Precio,', ',
    M.NombreMarca,', ',
    C.NombreCategoria) AS Producto,
    D.PorcentajeDescuento,
    D.FechaInicio,
    D.FechaFinal
FROM
    Productos.Producto P
    INNER JOIN Productos.Marca M ON P.Id_Marca = M.Id_Marca
    INNER JOIN Productos.Categoria C ON P.Id_Categoria = C.Id_Categoria
    LEFT JOIN Productos.Descuento D ON P.Id_Producto = D.Id_Producto;
GO

-- Crear una vista que incluya el nombre y apellido del empleado en las compras
CREATE VIEW VistaCompraConEmpleado
AS
SELECT
    C.Id_Compra,
    C.Proveedor,
    C.NombreCompra,
    C.Fecha_Compra,
    C.Total,
    C.Estado,
	C.Id_Empleado,
	CONCAT(
    E.NombresEmpleado,', ', E.ApellidosEmpleado) as Empleado,
    C.DescripcionCompra
FROM
    Ventas.Compra C
    INNER JOIN Persona.Empleados E ON C.Id_Empleado = E.Id_Empleado;
GO

select * from VistaCompraConEmpleado


-- Crear la vista corregida
CREATE VIEW VistaPagos
AS
SELECT 
    P.Id_Pago,
    P.Id_MetodoPago,
    CONCAT(
        'Tipo de Pago: ', M.Metodo
    ) as MetodoPago,
    P.Monto,
    P.FechaPago
FROM
    Ventas.Pagos P
INNER JOIN Ventas.MetodosPago M ON P.Id_MetodoPago = M.Id_MetodoPago;
GO

select * from VistaPagos

CREATE VIEW VistaVentas
AS
SELECT
	v.Id_Venta,
	v.Id_Cliente,
    c.NombresCliente AS Cliente,
	v.Id_Usuario,
    u.Usuario AS UsuarioEmpleado,
	v.Id_Pago,
	CONCAT(
    vp.MetodoPago, ', ',
    'Monto: ',vp.Monto,', ',
    'Fecha: ',vp.FechaPago) as Pago,
	v.FechaVenta
FROM
    Ventas.Venta v
    INNER JOIN Cliente.Clientes c ON v.Id_Cliente = c.Id_Cliente
    INNER JOIN Rol.Usuarios u ON v.Id_Usuario = u.Id_Usuario
    INNER JOIN VistaPagos vp ON v.Id_Pago = vp.Id_Pago;
go

CREATE VIEW VistaMarcasCategoria AS
SELECT
	p.Id_Producto,
   CONCAT(
    M.NombreMarca,', ',
    C.NombreCategoria) as Marcas
FROM
    Productos.Producto P
    JOIN Productos.Marca M ON P.Id_Marca = M.Id_Marca
    JOIN Productos.Categoria C ON P.Id_Categoria = C.Id_Categoria;

CREATE VIEW VistaCarrito AS
SELECT
    c.Id_Carrito,
    c.Id_Producto,
    CONCAT(
        'PRODUCTO: ',p.NombreProducto, ',  ',
        'MARCAS: ',vmc.Marcas, ',  ',
		'PRECIO: ', p.Precio
    ) as Venta,
	c.Cantidad,
	c.FechaAgregado
FROM
    Cliente.CarritoCompras c
    INNER JOIN Productos.Producto p ON c.Id_Producto = p.Id_Producto
    INNER JOIN Ventas.Venta v ON c.Id_Venta = v.Id_Venta
    INNER JOIN VistaMarcasCategoria vmc ON p.Id_Producto = vmc.Id_Producto;
go

CREATE VIEW VistaVentasCarrito
AS
SELECT
	v.Id_Venta,
	concat(
    'CLIENTE: ',c.NombresCliente,',  ',
    'MONTO: ',vp.Monto,', ',
    'FECHA PAGO: ',vp.FechaPago
	) as Pago
	
	
FROM
    Ventas.Venta v
    INNER JOIN Cliente.Clientes c ON v.Id_Cliente = c.Id_Cliente
    INNER JOIN VistaPagos vp ON v.Id_Pago = vp.Id_Pago;
go



CREATE VIEW VistaCarrito AS
SELECT
    c.Id_Carrito,
    c.Id_Producto,
    CONCAT(
        'PRODUCTO: ',p.NombreProducto, ',  ',
        'MARCAS: ',vmc.Marcas, ',  ',
		'PRECIO: ', p.Precio
    ) as Producto,
	c.Id_Venta,
	CONCAT(
		vvc.Id_Venta,',  ',
		vvc.Pago
	)as Venta,
	c.Cantidad,
	c.FechaAgregado
FROM
    Cliente.CarritoCompras c
    INNER JOIN Productos.Producto p ON c.Id_Producto = p.Id_Producto
    INNER JOIN Ventas.Venta v ON c.Id_Venta = v.Id_Venta
    INNER JOIN VistaMarcasCategoria vmc ON p.Id_Producto = vmc.Id_Producto
	INNER JOIN VistaVentasCarrito vvc ON v.Id_Venta = vvc.Id_Venta;
go


CREATE VIEW VistaDetalleVenta
as
select 
	DV.Id_DetalleVenta,
	DV.Id_Venta,
	CONCAT('Cliente: ',VV.Cliente,',  ','Usuario Empleado: ',VV.UsuarioEmpleado,',  ',VV.Pago) as Venta,
	DV.Id_Carrito,
	CONCAT('Cantidad: ',VC.Cantidad,',  ','Agregado el: ',VC.FechaAgregado,',  ') as Carrito,
	DV.Id_Producto,
	CONCAT('PRODUCTO: ',PC.NombreProducto,',  ','Precio: ',PC.Precio,',  ',PC.Marca,',  ',PC.Categoria) as Producto,
	DV.Cantidad,
	DV.PrecioUnitario,
	DV.Total
from
	Ventas.DetalleVenta DV
	INNER JOIN VistaVentas VV on DV.Id_Venta = VV.Id_Venta
	INNER JOIN VistaCarrito VC on DV.Id_Carrito = VC.Id_Carrito
	INNER JOIN VistaProductoCompleta PC on DV.Id_Producto = PC.Id_Producto
go
Create View VistaDetalleCompra
as
select 
	DC.Id_DetalleCompra,
	DC.Id_Compra,
	CONCAT('Proveedor: ',VCE.NombreCompra, ',  ','Fecha Compra: ',VCE.Fecha_Compra, ',  ','Empleado: ',VCE.Empleado) as Compra,
	DC.Cantidad,
	DC.PrecioUnitario,
	DC.EstadoCompra,
	DC.Total
	from 
	Ventas.DetalleCompra DC
	INNER JOIN VistaCompraConEmpleado VCE on DC.Id_Compra = VCE.Id_Compra
go
Select * from VistaDetalleVenta

select * from VistaEmpleadoDireccion

create view VistaGrupos
as
select 
	G.Id_Grupo,
	G.Id_Empleado,
	CONCAT('Empleado: ',E.NombresEmpleado+ ' ' + E.ApellidosEmpleado, ',  ','Cargo: ', E.CargoEmpleado ,',  ','Telefono: ',E.Telefono) as Empleado,
	G.Turno

from
	Grupos.Grupo G
	INNER JOIN VistaEmpleadoDireccion E on G.Id_Empleado = E.Id_Empleado
go

select * from VistaGrupos






select * from VistaDetalleVenta
select * from VistaCarrito
select * from VistaVentasCarrito 
select * from VistaMarcasCategoria
select * from VistaVentas
select * from Cliente.Clientes
select * from VistaProductoConDescuento
select * from VistaProductoCompleta
select * from Productos.Categoria
select * from Productos.Producto
select * from VistaCarrito
