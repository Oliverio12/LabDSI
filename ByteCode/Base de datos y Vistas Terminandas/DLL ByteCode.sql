create database TiendaByteCode;
go

use TiendaByteCode
go

--Esquemas
create Schema Departamento
go
create Schema Rol
go
create Schema Grupos
go
create Schema Productos
go
create Schema Cliente
go
create Schema Ventas
go
create Schema Persona
go

--Departamentos
create table Departamento.Departamentos( --Listo
	Id_Departamento char(2) primary key,
	Departamento varchar(60) not null,
	Pais varchar(60)
);
create table Departamento.Municipios( --Listo
	Id_Municipio char(3) primary key,
	Municipio varchar(60) not null,
	Id_Departamento char(2) not null
);
create table Departamento.Distritos( --Listo
	Id_Distrito varchar(5) primary key,
	Distrito varchar(60) not null,
	Id_Municipio char(3) not null
);
create table Departamento.Direcciones( --Listo
	Id_Direccion int primary key identity(1, 1),
    Linea1 varchar(100) not null,
    Linea2 varchar(100),
    Id_Distrito varchar(5) not null,
    CodigoPostal int,
);


--Empleados
create table Persona.Cargos( --Listo
	Id_Cargo int primary key identity(1, 1),
    Cargo varchar(45) not null
);

create table Persona.Empleados( --Listo
	Id_Empleado int primary key identity(1, 1),
    DUI_Empleado varchar(10) not null,
    ISSS_Empleado int not null,
    NombresEmpleado varchar(60) not null,
    ApellidosEmpleado varchar(60) not null,
    FechaNacEmpleado date not null,
    Telefono varchar(10) not null,
    Correo varchar(100),
    Id_Cargo int not null,
    Id_Direccion int not null,   
);


--Manejo de Roles

create table Rol.Opciones( --Listo
	Id_Opcion int primary key identity(1, 1),
    NombreOpcion varchar(60) not null
);

create table Rol.Roles( --Listo
	Id_Rol int primary key identity(1, 1),
    NombreRol varchar(60) not null
);

create table Rol.AsignacionRolesOpciones( --Listo
	Id_AsignacionRol int primary key identity(1, 1),
    Id_Rol int not null,
    Id_Opcion int not null
);

create table Rol.Usuarios( --Listo
	Id_Usuario int primary key identity(1, 1),
	Id_Empleado int not null,
	Id_Rol int not null,
    Usuario varchar(60) not null,
    Clave varchar(60) not null,
);

--Grupos


create table Grupos.Grupo( --Listo
	Id_Grupo int primary key identity(1, 1),
	Id_Empleado int not null,	
    Turno varchar(60) not null
);


--Clientes
create table Cliente.Clientes( --listos
    Id_Cliente int primary key identity(1, 1),
    NombresCliente varchar(60) not null,
    ApellidosCliente varchar(60) not null,
    DUI_Cliente varchar(10) not null,
    Telefono varchar(10) not null,
    Correo varchar(100),
    Id_Direccion int not null,
	Usuario varchar(50) not null,
    Clave varchar(100) not null,
);

create table Cliente.RegistroClientes (
    Id_Registro int primary key identity(1, 1),
    Id_Cliente int,
    FechaRegistro datetime
);

select * from Cliente.RegistroClientes
SELECT
    C.*,
    R.Id_Registro,
    R.FechaRegistro
FROM
    Cliente.Clientes C
LEFT JOIN
    Cliente.RegistroClientes R ON C.Id_Cliente = R.Id_Cliente;



--Productos

create table Productos.Inventario ( --Listo
    Id_Inventario int identity(1,1) primary key,
    Stock int not null,
    Nombre_producto nvarchar(255) not null,
    Descripcion nvarchar(255),
    Precio decimal(10,2) not null,
    Fecha_adquisicion date,
    Fecha_ultima_actualizacion date,
    Categoria nvarchar(50),
    Proveedor nvarchar(255)
);

create table Productos.Marca( --Listo
    Id_Marca int primary key identity(1, 1),
    NombreMarca varchar(60) not null
);

create table Productos.Categoria( --Listo
    Id_Categoria int primary key identity(1, 1),
    NombreCategoria varchar(60) not null
);

create table Productos.Producto( --Listo
    Id_Producto int primary key identity(1, 1),
    NombreProducto varchar(100) not null,
    Descripcion varchar(255),
    Precio decimal(10, 2) not null,
	Id_Inventario int not null,
    Id_Marca int not null,
    Id_Categoria int not null
);


create table Productos.Descuento( --Listo
    Id_Descuento int primary key identity(1, 1),
    Id_Producto int not null,
    PorcentajeDescuento decimal(5, 2) not null,
    FechaInicio date null,
    FechaFinal date not null
);


--Ventas

create table Ventas.Compra ( --Listo
    Id_Compra int identity(1, 1) primary key,
    Proveedor varchar(100) not null,
	NombreCompra varchar(255) not null,
    Fecha_Compra date not null,
    Total decimal(10, 2) not null,
    Estado varchar(50) not null,
    Id_Empleado int not null,
    DescripcionCompra varchar(255) not null
    
);

create table Ventas.DetalleCompra ( --Listo
    Id_DetalleCompra int identity(1, 1) primary key,
    Id_Compra int not null,
    Cantidad int not null,
    PrecioUnitario decimal(10, 2) not null,
    EstadoCompra varchar(60) not null,
    Total decimal(10, 2) not null,
);

create table Ventas.MetodosPago( --Listo
    Id_MetodoPago int primary key identity(1, 1),
    Metodo varchar(60) not null,
);
create table Ventas.Pagos( --Listo
    Id_Pago int primary key identity(1, 1),
    Id_MetodoPago int not null,
    Monto decimal(10, 2) not null,
    FechaPago date null
);


create table Ventas.Venta(
    Id_Venta int primary key identity(1, 1),
    Id_Cliente int not null,
    Id_Usuario int not null,
	Id_Pago int not null,
    FechaVenta date not null
);

--Carrito
create table Cliente.CarritoCompras(
    Id_Carrito int primary key identity(1, 1),
    Id_Producto int not null,
	Id_Venta int not null,
    Cantidad int not null,
    FechaAgregado date not null
);

create table Ventas.DetalleVenta (
    Id_DetalleVenta int identity(1, 1) primary key,
    Id_Venta int not null,
    Id_Carrito int not null,
    Id_Producto int not null,
    Cantidad int not null,
    PrecioUnitario decimal(10, 2) not null,
    Total decimal(10, 2) not null,
);

-- Relaciones para el esquema Departamento
alter table Departamento.Municipios add foreign key (Id_Departamento) references Departamento.Departamentos(Id_Departamento);
alter table Departamento.Distritos add foreign key (Id_Municipio) references Departamento.Municipios(Id_Municipio);
alter table Departamento.Direcciones add foreign key (Id_Distrito) references Departamento.Distritos(Id_Distrito);

-- Relaciones para el esquema Persona
alter table Persona.Empleados add foreign key (Id_Cargo) references Persona.Cargos(Id_Cargo);
alter table Persona.Empleados add foreign key (Id_Direccion) references Departamento.Direcciones(Id_Direccion);

-- Relaciones para el esquema Rol
alter table Rol.AsignacionRolesOpciones add foreign key (Id_Rol) references Rol.Roles(Id_Rol);
alter table Rol.AsignacionRolesOpciones add foreign key (Id_Opcion) references Rol.Opciones(Id_Opcion);
alter table Rol.Usuarios add foreign key (Id_Empleado) references Persona.Empleados(Id_Empleado);
alter table Rol.Usuarios add foreign key (Id_Rol) references Rol.Roles(Id_Rol);

-- Relaciones para el esquema Grupos
alter table Grupos.Grupo add foreign key (Id_Empleado) references Persona.Empleados(Id_Empleado);

-- Relaciones para el esquema Cliente
alter table Cliente.Clientes add foreign key (Id_Direccion) references Departamento.Direcciones(Id_Direccion);

-- Relaciones para el esquema Productos
alter table Productos.Producto add foreign key (Id_Inventario) references Productos.Inventario(Id_Inventario);
alter table Productos.Producto add foreign key (Id_Marca) references Productos.Marca(Id_Marca);
alter table Productos.Producto add foreign key (Id_Categoria) references Productos.Categoria(Id_Categoria);
alter table Productos.Descuento add foreign key (Id_Producto) references Productos.Producto(Id_Producto);

-- Relaciones para el esquema Ventas

alter table Ventas.DetalleCompra add foreign key (Id_Compra) references Ventas.Compra(Id_Compra);
alter table Ventas.Pagos add foreign key (Id_MetodoPago) references Ventas.MetodosPago(Id_MetodoPago);
alter table Ventas.Venta add foreign key (Id_Cliente) references Cliente.Clientes(Id_Cliente);
alter table Ventas.Venta add foreign key (Id_Usuario) references Rol.Usuarios(Id_Usuario);
alter table Ventas.Venta add foreign key (Id_Pago) references Ventas.Pagos(Id_Pago);
alter table Ventas.DetalleVenta add foreign key (Id_Venta) references Ventas.Venta(Id_Venta);
alter table Ventas.DetalleVenta add foreign key (Id_Carrito) references Cliente.CarritoCompras(Id_Carrito);
alter table Ventas.DetalleVenta add foreign key (Id_Producto) references Productos.Producto(Id_Producto);
alter table Cliente.CarritoCompras add foreign key (Id_Producto) references Productos.Producto(Id_Producto);
alter table Cliente.CarritoCompras add foreign key (Id_Venta) references Ventas.Venta(Id_Venta);
alter table Ventas.Compra add foreign key (Id_Empleado) references Persona.Empleados(Id_Empleado);

/*
CREATE TRIGGER trg_Cliente_Clientes_Insertar
ON Cliente.Clientes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Id_Cliente int;

    SELECT @Id_Cliente = Id_Cliente
    FROM inserted;

    INSERT INTO Cliente.RegistroClientes (Id_Cliente, FechaRegistro)
    VALUES (@Id_Cliente, GETDATE());
END;

*/