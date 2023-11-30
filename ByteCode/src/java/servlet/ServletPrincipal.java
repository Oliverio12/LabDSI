package servlet;

//importaciones de servlet
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import librerias de conexion con BD
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//import de modelos
import Models.ViewModelCargo;
import Models.ViewModelCarritoCompras;
import Models.ViewModelCategoria;
import Models.ViewModelClientes;
import Models.ViewModelCompra;
import Models.ViewModelDescuento;
import Models.ViewModelDetalleCompra;
import Models.ViewModelDetalleVenta;
import Models.ViewModelEmpleados;
import Models.ViewModelGrupos;
import Models.ViewModelInventario;
import Models.ViewModelMarca;
import Models.ViewModelMetodosPago;
import Models.ViewModelPagos;
import Models.ViewModelProductos;
import Models.ViewModelUsuarios;
import Models.ViewModelVenta;

public class ServletPrincipal extends HttpServlet {

    //Estableciendo conexion con la BD
    private final String usuario = "sa";
    private final String contrasenia = "admin123";
    private final String servidor = "localhost:1433";
    private final String bd = "TiendaByteCode";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName=" + bd
            + ";user=" + usuario
            + ";password=" + contrasenia
            + ";encrypt=false;trustServerCertificate=false;";

    //Funciones del CRUD sobre la base de datos
    //FUNCIONES DE SELECT
    //Cargos
    public void mostrarCargos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Persona.Cargos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCargo> listaCargos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCargo cargo = new ViewModelCargo();
                    cargo.setId_Cargo(rs.getInt("Id_Cargo"));
                    cargo.setCargo(rs.getString("Cargo"));
                    listaCargos.add(cargo);
                }
                request.setAttribute("listaCargos", listaCargos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de cargos

    //Inicio Grupos
    public void mostrarGrupo(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaGrupos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelGrupos> listaTurno = new ArrayList<>();
                while (rs.next()) {
                    ViewModelGrupos grupo = new ViewModelGrupos();
                    grupo.setId_Grupo(rs.getInt("Id_Grupo"));
                    grupo.setId_Empleado(rs.getInt("Id_Empleado"));
                    grupo.setEmpleado(rs.getString("Empleado"));
                    grupo.setTurno(rs.getString("Turno"));
                    listaTurno.add(grupo);
                }
                request.setAttribute("listaTurno", listaTurno);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de grupos

    //empleados
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaEmpleadoDireccion";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();

                while (rs.next()) {
                    ViewModelEmpleados empleado = new ViewModelEmpleados();
                    empleado.setId_Empleado(rs.getInt("Id_Empleado"));
                    empleado.setId_Empleado(rs.getInt("Id_Empleado"));
                    empleado.setDui_Empleado(rs.getString("DUI_Empleado"));
                    empleado.setIsss_Empleado(rs.getInt("ISSS_Empleado"));
                    empleado.setNombresEmpleado(rs.getString("NombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("ApellidosEmpleado"));
                    empleado.setFechaNacEmpleado(rs.getDate("FechaNacEmpleado"));
                    empleado.setTelefono(rs.getString("Telefono"));
                    empleado.setCorreo(rs.getString("Correo"));
                    empleado.setId_Cargo(rs.getInt("Id_Cargo"));
                    empleado.setCargo(rs.getString("CargoEmpleado"));
                    empleado.setId_Direccion(rs.getInt("Id_Direccion"));
                    empleado.setDireccionCompleta(rs.getString("Direccion"));

                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//fin de empleados

    //Usuarios
    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaUsuarios ";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();

                while (rs.next()) {
                    ViewModelUsuarios user = new ViewModelUsuarios();
                    user.setId_Usuario(rs.getInt("Id_Usuario"));
                    user.setId_Empleado(rs.getInt("Id_Empleado"));
                    user.setNombreCompleto(rs.getString("nombreCompleto"));
                    user.setId_Rol(rs.getInt("Id_Rol"));
                    user.setNombreRol(rs.getString("NombreRol"));
                    user.setUsuario(rs.getString("Usuario"));
                    user.setClave(rs.getString("Clave"));
                    listaUsuarios.add(user);
                }
                request.setAttribute("listaUsuarios", listaUsuarios);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }// fin de usuarios
    //fin Usuarios

    //Clientes
    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select\n"
                        + "    C.*,\n"
                        + "    R.FechaRegistro\n"
                        + "FROM\n"
                        + "    VistaClientesDireccion C\n"
                        + "left join\n"
                        + "    Cliente.RegistroClientes R ON C.Id_Cliente = R.Id_Cliente;";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();
 
                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setId_Cliente(rs.getInt("Id_Cliente"));
                    cliente.setNombresCliente(rs.getString("NombresCliente"));
                    cliente.setApellidosCliente(rs.getString("ApellidosCliente"));
                    cliente.setDuiCliente(rs.getString("DUI_Cliente"));
                    cliente.setTelefono(rs.getString("Telefono"));
                    cliente.setCorreo(rs.getString("Correo"));
                    cliente.setId_Direccion(rs.getInt("Id_Direccion"));
                    cliente.setDireccionCompleta(rs.getString("Direccion"));
                    cliente.setUsuario(rs.getString("Usuario"));
                    cliente.setClave(rs.getString("Clave"));
                    cliente.setFechaRegistro(rs.getString("FechaRegistro"));
                    listaClientes.add(cliente);
                }
                request.setAttribute("listaClientes", listaClientes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }// fin de Clientes
    //Fin Clientes

    ///Inventario
    public void mostrarInventario(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Inventario";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelInventario> listaInventario = new ArrayList<>();

                while (rs.next()) {
                    ViewModelInventario inventario = new ViewModelInventario();
                    inventario.setId_Inventario(rs.getInt("Id_Inventario"));
                    inventario.setStock(rs.getInt("Stock"));
                    inventario.setNombreProducto(rs.getString("Nombre_producto"));
                    inventario.setDescripcion(rs.getString("Descripcion"));
                    inventario.setPrecio(rs.getDouble("Precio"));
                    inventario.setFechaAdquisicion(rs.getDate("Fecha_adquisicion"));
                    inventario.setFechaUltimaActualizacion(rs.getDate("Fecha_ultima_actualizacion"));
                    inventario.setCategoria(rs.getString("Categoria"));
                    inventario.setProveedor(rs.getString("Proveedor"));
                    listaInventario.add(inventario);
                }
                request.setAttribute("listaInventario", listaInventario);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin Inventario
    //Fin Inventarios

    //Inicio Productos
    public void mostrarProducto(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaProductoCompleta";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelProductos> listaProductos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelProductos producto = new ViewModelProductos();
                    producto.setId_Producto(rs.getInt("Id_Producto"));
                    producto.setNombreProducto(rs.getString("NombreProducto"));
                    producto.setDescripcion(rs.getString("DescripcionProducto"));
                    producto.setPrecio(rs.getDouble("Precio"));
                    producto.setId_Inventario(rs.getInt("Id_Inventario"));
                    producto.setInventario(rs.getString("Inventario"));
                    producto.setId_Marca(rs.getInt("Id_Marca"));
                    producto.setMarca(rs.getString("Marca"));
                    producto.setId_Categoria(rs.getInt("Id_Categoria"));
                    producto.setCategoria(rs.getString("Categoria"));

                    listaProductos.add(producto);
                }
                request.setAttribute("listaProductos", listaProductos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin Productos

    //Descuento
    public void mostrarDescuento(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaProductoConDescuento";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDescuento> listaDescuento = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDescuento descuento = new ViewModelDescuento();
                    descuento.setId_Descuento(rs.getInt("Id_Descuento"));
                    descuento.setId_Producto(rs.getInt("Id_Producto"));
                    descuento.setProducto(rs.getString("Producto"));
                    descuento.setPorcentajeDescuento(rs.getDouble("PorcentajeDescuento"));
                    descuento.setFechaInicio(rs.getDate("FechaInicio"));
                    descuento.setFechaFinal(rs.getDate("FechaFinal"));
                    listaDescuento.add(descuento);
                }
                request.setAttribute("listaDescuento", listaDescuento);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin Descuento

    //Inicio Compras
    public void mostrarCompras(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaCompraConEmpleado";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCompra> listaCompra = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCompra compra = new ViewModelCompra();
                    compra.setId_Compra(rs.getInt("Id_Compra"));
                    compra.setProveedor(rs.getString("Proveedor"));
                    compra.setNombreCompra(rs.getString("NombreCompra"));
                    compra.setFecha_Compra(rs.getDate("Fecha_Compra"));
                    compra.setTotal(rs.getDouble("Total"));
                    compra.setEstado(rs.getString("Estado"));
                    compra.setId_Empleado(rs.getInt("Id_Empleado"));
                    compra.setEmpleado(rs.getString("Empleado"));
                    compra.setDescripcionCompra(rs.getString("DescripcionCompra"));

                    listaCompra.add(compra);
                }
                request.setAttribute("listaCompra", listaCompra);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin compras

    // inicio  Detalles de compra
    public void mostrarDetallesCompra(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaDetalleCompra";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDetalleCompra> listaDetalleCompra = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDetalleCompra detalleCompra = new ViewModelDetalleCompra();
                    detalleCompra.setId_DetalleCompra(rs.getInt("Id_DetalleCompra"));
                    detalleCompra.setId_Compra(rs.getInt("Id_Compra"));
                    detalleCompra.setCompra(rs.getString("Compra"));
                    detalleCompra.setCantidad(rs.getInt("Cantidad"));
                    detalleCompra.setPrecioUnitario(rs.getDouble("PrecioUnitario"));
                    detalleCompra.setEstadoCompra(rs.getString("EstadoCompra"));
                    detalleCompra.setTotal(rs.getDouble("Total"));
                    listaDetalleCompra.add(detalleCompra);
                }
                request.setAttribute("listaDetalleCompra", listaDetalleCompra);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin detalles de compra

    // inicio metodos de pago
    public void mostrarMetodosPago(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.MetodosPago";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelMetodosPago> listaMetodosPago = new ArrayList<>();

                while (rs.next()) {
                    ViewModelMetodosPago metodoPago = new ViewModelMetodosPago();
                    metodoPago.setIdMetodoPago(rs.getInt("Id_MetodoPago"));
                    metodoPago.setMetodo(rs.getString("Metodo"));

                    listaMetodosPago.add(metodoPago);
                }
                request.setAttribute("listaMetodosPago", listaMetodosPago);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin metodos de pago

    //inicio de pagos
    public void mostrarPagos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaPagos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelPagos> listaPagos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelPagos pago = new ViewModelPagos();
                    pago.setId_Pago(rs.getInt("Id_Pago"));
                    pago.setId_MetodoPago(rs.getInt("Id_MetodoPago"));
                    pago.setMetodoPago(rs.getString("MetodoPago"));
                    pago.setMonto(rs.getDouble("Monto"));
                    pago.setFechaPago(rs.getDate("FechaPago"));
                    listaPagos.add(pago);
                }
                request.setAttribute("listaPagos", listaPagos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin de pagos

    //inicio Ventas
    public void mostrarVentas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaVentas";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelVenta> listaVentas = new ArrayList<>();

                while (rs.next()) {
                    ViewModelVenta venta = new ViewModelVenta();
                    venta.setId_Venta(rs.getInt("Id_Venta"));
                    venta.setId_Cliente(rs.getInt("Id_Cliente"));
                    venta.setCliente(rs.getString("Cliente"));
                    venta.setId_Usuario(rs.getInt("Id_Usuario"));
                    venta.setUsuarioEmpleado(rs.getString("UsuarioEmpleado"));
                    venta.setId_Pago(rs.getInt("Id_Pago"));
                    venta.setPago(rs.getString("Pago"));
                    venta.setFechaVenta(rs.getDate("FechaVenta"));
                    listaVentas.add(venta);
                }
                request.setAttribute("listaVentas", listaVentas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin de ventas

    //Inicio de Carritos
    public void mostrarCarrito(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaCarrito";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCarritoCompras> listaCarrito = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCarritoCompras carritoCompras = new ViewModelCarritoCompras();
                    carritoCompras.setId_Carrito(rs.getInt("Id_Carrito"));
                    carritoCompras.setId_Producto(rs.getInt("Id_Producto"));
                    carritoCompras.setProducto(rs.getString("Producto"));
                    carritoCompras.setId_Venta(rs.getInt("Id_Venta"));
                    carritoCompras.setVenta(rs.getString("Venta"));
                    carritoCompras.setCantidad(rs.getInt("Cantidad"));
                    carritoCompras.setFechaAgregado(rs.getDate("FechaAgregado"));
                    listaCarrito.add(carritoCompras);
                }
                request.setAttribute("listaCarrito", listaCarrito);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin de Carritos

    //Inicio Detalles de venta
    public void mostrarDetallesVenta(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaDetalleVenta";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDetalleVenta> listaDetalleVenta = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDetalleVenta detalleVenta = new ViewModelDetalleVenta();
                    detalleVenta.setId_DetalleVenta(rs.getInt("Id_DetalleVenta"));
                    detalleVenta.setId_Venta(rs.getInt("Id_Venta"));
                    detalleVenta.setVenta(rs.getString("Venta"));
                    detalleVenta.setId_Carrito(rs.getInt("Id_Carrito"));
                    detalleVenta.setCarrito(rs.getString("Carrito"));
                    detalleVenta.setId_Producto(rs.getInt("Id_Producto"));
                    detalleVenta.setProducto(rs.getString("Producto"));
                    detalleVenta.setCantidad(rs.getInt("Cantidad"));
                    detalleVenta.setPrecioUnitario(rs.getDouble("PrecioUnitario"));
                    detalleVenta.setTotal(rs.getDouble("Total"));

                    listaDetalleVenta.add(detalleVenta);
                }
                request.setAttribute("listaDetalleVenta", listaDetalleVenta);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin detalle de ventas

     //Marca
    public void mostrarMarca(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Marca";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelMarca> listaMarca = new ArrayList<>();

                while (rs.next()) {
                    ViewModelMarca marca = new ViewModelMarca();
                    marca.setId_Marca(rs.getInt("Id_Marca"));
                    marca.setNombreMarca(rs.getString("NombreMarca"));
                    listaMarca.add(marca);
                }
                request.setAttribute("listaMarca", listaMarca);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de cargos
    //fin Marca
    
    //Categoria
    public void mostrarCategoria(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Categoria";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCategoria> listaCategoria = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCategoria categoria = new ViewModelCategoria();
                    categoria.setId_Categoria(rs.getInt("Id_Categoria"));
                    categoria.setNombreCategoria(rs.getString("NombreCategoria"));
                    listaCategoria.add(categoria);
                }
                request.setAttribute("listaCategoria", listaCategoria);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de cargos
    //Fin Categoria
    
    
    
    
    //FUNCIONES DE INSERT ------------------------------------------------------------
    //Empleados Insert
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES

        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Persona.Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, DUI_Empleado);
                pstmt.setString(2, ISSS_Empleado);
                pstmt.setString(3, nombresEmpleado);
                pstmt.setString(4, apellidosEmpleado);
                pstmt.setString(5, fechaNacEmpleado);
                pstmt.setString(6, telefonoEmpleado);
                pstmt.setString(7, correo);
                pstmt.setString(8, ID_Cargo);
                pstmt.setString(9, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //FIn Empleados Insert

    //Cargo Insert
    public void agregarCargo(HttpServletRequest request, HttpServletResponse response) {

        String Cargo = request.getParameter("Cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Persona.Cargos values ( ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Cargo);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Cargo Insert

    //Usuario Insert
    public void agregarUsuario(HttpServletRequest request, HttpServletResponse response) {

        String id_Empleado = request.getParameter("id_Empleado");
        String Id_Rol = request.getParameter("id_Rol");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Rol.Usuarios values ( ?,?,?,? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Empleado);
                pstmt.setString(2, Id_Rol);
                pstmt.setString(3, Usuario);
                pstmt.setString(4, Clave);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Usuario Insert

    //Cliente Insert
    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {

        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String duiCliente = request.getParameter("duiCliente");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String id_Direccion = request.getParameter("id_Direccion");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cliente.Clientes values ( ?, ?, ?, ?, ?, ?, ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, duiCliente);
                pstmt.setString(4, telefono);
                pstmt.setString(5, correo);
                pstmt.setString(6, id_Direccion);
                pstmt.setString(7, Usuario);
                pstmt.setString(8, Clave);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Cliente Insert
    
    //Inventario Insert
    public void agregarInventario(HttpServletRequest request, HttpServletResponse response) {

        String stock = request.getParameter("stock");
        String nombreProducto = request.getParameter("nombreProducto");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String fechaAdquisicion = request.getParameter("fechaAdquisicion");
        String fechaUltimaActualizacion = request.getParameter("fechaUltimaActualizacion");
        String categoria = request.getParameter("categoria");
        String proveedor = request.getParameter("proveedor");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos.Inventario values ( ?, ?, ?, ?, ?, ?, ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, stock);
                pstmt.setString(2, nombreProducto);
                pstmt.setString(3, descripcion);
                pstmt.setString(4, precio);
                pstmt.setString(5, fechaAdquisicion);
                pstmt.setString(6, fechaUltimaActualizacion);
                pstmt.setString(7, categoria);
                pstmt.setString(8, proveedor);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Inventario Insert
    
    //Marca Insert
    public void agregarMarca(HttpServletRequest request, HttpServletResponse response) {

        String nombreMarca = request.getParameter("nombreMarca");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos.Marca values ( ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreMarca);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Marca Insert

    //Producto Insert
    public void agregarProducto(HttpServletRequest request, HttpServletResponse response) {

        String nombreProducto = request.getParameter("nombreProducto");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String id_Inventario = request.getParameter("id_Inventario");
        String id_Marca = request.getParameter("id_Marca");
        String id_Categoria = request.getParameter("id_Categoria");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos.Producto values ( ?, ?, ?, ?, ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreProducto);
                pstmt.setString(2, descripcion);
                pstmt.setString(3, precio);
                pstmt.setString(4, id_Inventario);
                pstmt.setString(5, id_Marca);
                pstmt.setString(6, id_Categoria);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Producto Insert
    
    //Descuento Insert
    public void agregarDescuento(HttpServletRequest request, HttpServletResponse response) {

        String id_Producto = request.getParameter("id_Producto");
        String porcentajeDescuento = request.getParameter("porcentajeDescuento");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFinal = request.getParameter("fechaFinal");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos.Descuento values ( ?, ?, ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Producto);
                pstmt.setString(2, porcentajeDescuento);
                pstmt.setString(3, fechaInicio);
                pstmt.setString(4, fechaFinal);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Descuento Insert
    
    //Compra Insert
    public void agregarCompra(HttpServletRequest request, HttpServletResponse response) {

        String proveedor = request.getParameter("proveedor");
        String nombreCompra = request.getParameter("nombreCompra");
        String fecha_Compra = request.getParameter("fecha_Compra");
        String total = request.getParameter("total");
        String estado = request.getParameter("estado");
        String id_Empleado = request.getParameter("id_Empleado");
        String descripcionCompra = request.getParameter("descripcionCompra");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.Compra values ( ?,?,?,?,?,?,? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, proveedor);
                pstmt.setString(2, nombreCompra);
                pstmt.setString(3, fecha_Compra);
                pstmt.setString(4, total);
                pstmt.setString(5, estado);
                pstmt.setString(6, id_Empleado);
                pstmt.setString(7, descripcionCompra);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Compra Insert
    
    //Detalle compra Insert
    public void agregarDetalleCompra(HttpServletRequest request, HttpServletResponse response) {

        String Id_Compra = request.getParameter("id_Compra");
        String cantidad = request.getParameter("cantidad");
        String precioUnitario = request.getParameter("precioUnitario");
        String estadoCompra = request.getParameter("estadoCompra");
        String total = request.getParameter("total");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.DetalleCompra values ( ?,?,?,?,? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Id_Compra);
                pstmt.setString(2, cantidad);
                pstmt.setString(3, precioUnitario);
                pstmt.setString(4, estadoCompra);
                pstmt.setString(5, total);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //fin Detalle compra Insert
    
    //Metodo de pago Insert
    public void agregarMetodosPago(HttpServletRequest request, HttpServletResponse response) {

        String Metodo = request.getParameter("metodo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.MetodosPago values ( ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Metodo);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Metodo de pago Insert
    
    //Metodo de pago Insert
    public void agregarPago(HttpServletRequest request, HttpServletResponse response) {

        String id_MetodoPago = request.getParameter("id_MetodoPago");
        String monto = request.getParameter("monto");
        String fechaPago = request.getParameter("fechaPago");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.Pagos values ( ?,?,? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_MetodoPago);
                pstmt.setString(2, monto);
                pstmt.setString(3, fechaPago);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Metodo de pago Insert
    
    //Venta Insert
    public void agregarVenta(HttpServletRequest request, HttpServletResponse response) {

        String id_Cliente = request.getParameter("id_Cliente");
        String id_Usuario = request.getParameter("id_Usuario");
        String id_Pago = request.getParameter("id_Pago");
        String fechaVenta = request.getParameter("fechaVenta");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.Venta values ( ?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Cliente);
                pstmt.setString(2, id_Usuario);
                pstmt.setString(3, id_Pago);
                pstmt.setString(4, fechaVenta);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Venta Insert
    
    //Carrito Insert
    public void agregarCarrito(HttpServletRequest request, HttpServletResponse response) {

        String id_Producto = request.getParameter("id_Producto");
        String id_Venta = request.getParameter("id_Venta");
        String cantidad = request.getParameter("cantidad");
        String fechaAgregado = request.getParameter("fechaAgregado");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cliente.CarritoCompras values ( ?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Producto);
                pstmt.setString(2, id_Venta);
                pstmt.setString(3,cantidad);
                pstmt.setString(4,fechaAgregado);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Carrito Insert
    
    //DetalleVenta Insert
    public void agregarDetalleVenta(HttpServletRequest request, HttpServletResponse response) {

        String id_Venta = request.getParameter("id_Venta");
        String id_Carrito = request.getParameter("id_Carrito");
        String id_Producto = request.getParameter("id_Producto");
        String cantidad = request.getParameter("cantidad");
        String precioUnitario = request.getParameter("precioUnitario");
        String total = request.getParameter("total");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Ventas.DetalleVenta values ( ?,?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Venta);
                pstmt.setString(2, id_Carrito);
                pstmt.setString(3, id_Producto);
                pstmt.setString(4, cantidad);
                pstmt.setString(5, precioUnitario);
                pstmt.setString(6, total);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin DetalleVenta Insert
    
    //Metodo de pago Insert
    public void agregarGrupo(HttpServletRequest request, HttpServletResponse response) {

        String id_Empleado = request.getParameter("id_Empleado");
        String turno = request.getParameter("turno");
        

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Grupos.Grupo values ( ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Empleado);
                pstmt.setString(2, turno);
               

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Metodo de pago Insert
    
    //Categoria Insert
    public void agregarCategoria(HttpServletRequest request, HttpServletResponse response) {

        String nombreCategoria = request.getParameter("nombreCategoria");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos.Categoria values (?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreCategoria);
             

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Categoria Insert
    
    
    
    
    //FUNCIONES DE UPDATE-------------------------------------------------------------------
    //Update Empleado
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Empleado = request.getParameter("id_Empleado");
        String DUI_Empleado = request.getParameter("dui_Empleado");
        String ISSS_Empleado = request.getParameter("isss_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("id_Cargo");
        String ID_Direccion = request.getParameter("id_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Persona.Empleados set "
                        + "DUI_Empleado='" + DUI_Empleado + "', "
                        + "ISSS_Empleado='" + ISSS_Empleado + "', "
                        + "NombresEmpleado='" + nombresEmpleado + "', "
                        + "ApellidosEmpleado='" + apellidosEmpleado + "', "
                        + "FechaNacEmpleado='" + fechaNacEmpleado + "', "
                        + "Telefono='" + telefonoEmpleado + "', "
                        + "Correo='" + correo + "', "
                        + "Id_Cargo='" + ID_Cargo + "', "
                        + "Id_Direccion='" + ID_Direccion + "' "
                        + "where Id_Empleado='" + Id_Empleado + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //fin Update Empleado

    //Update Usuario
    public void modificarUsuario(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Usuario = request.getParameter("id_Usuario");
        String Id_Empleado = request.getParameter("id_Empleado");
        String Id_Rol = request.getParameter("id_Rol");
        String Usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Rol.Usuarios set "
                        + "Id_Empleado='" + Id_Empleado + "', "
                        + "Id_Rol='" + Id_Rol + "', "
                        + "Usuario='" + Usuario + "', "
                        + "Clave='" + clave + "' "
                        + "where Id_Usuario='" + Id_Usuario + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Usuario

    //Inicio Update Cargo
    public void modificarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Cargo = request.getParameter("id_Cargo");
        String Cargo = request.getParameter("cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Persona.Cargos set "
                        + "Cargo='" + Cargo + "'"
                        + "Where Id_Cargo ='" + Id_Cargo + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Cargo
    
    //Inicio Update Categoria
    public void modificarCategoria(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Categoria = request.getParameter("id_Categoria");
        String nombreCategoria = request.getParameter("nombreCategoria");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Productos.Categoria set "
                        + "NombreCategoria='" + nombreCategoria + "'"
                        + "Where Id_Categoria ='" + id_Categoria + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Categoria

    //Update Cliente
    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Cliente = request.getParameter("id_Cliente");
        String nombresClietne = request.getParameter("nombresCliente");
        String ApellidosCliente = request.getParameter("apellidosCliente");
        String duiCliente = request.getParameter("duiCliente");
        String Telefono = request.getParameter("telefono");
        String Correo = request.getParameter("correo");
        String Id_Direccion = request.getParameter("id_Direccion");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Cliente.Clientes set "
                        + "NombresCliente='" + nombresClietne + "', "
                        + "ApellidosCliente='" + ApellidosCliente + "', "
                        + "DUI_Cliente='" + duiCliente + "', "
                        + "Telefono='" + Telefono + "', "
                        + "Correo='" + Correo + "' ,"
                        + "Id_Direccion='" + Id_Direccion + "' ,"
                        + "Usuario='" + Usuario + "', "
                        + "Clave='" + Clave + "' "
                        + "where Id_Cliente='" + id_Cliente + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Cliente
    
    //Update Inventario
    public void modificarInventario(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Inventario = request.getParameter("id_Inventario");
        String stock = request.getParameter("stock");
        String nombreProducto = request.getParameter("nombreProducto");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String fechaAdquisicion = request.getParameter("fechaAdquisicion");
        String fechaUltimaActualizacion = request.getParameter("fechaUltimaActualizacion");
        String categoria = request.getParameter("categoria");
        String proveedor = request.getParameter("proveedor");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Productos.Inventario set "
                        + "Stock='" + stock + "', "
                        + "Nombre_producto='" + nombreProducto + "', "
                        + "Descripcion='" + descripcion + "', "
                        + "Precio='" + precio + "', "
                        + "Fecha_adquisicion='" + fechaAdquisicion + "', "
                        + "Fecha_ultima_actualizacion='" + fechaUltimaActualizacion + "' ,"
                        + "Categoria='" + categoria + "' ,"
                        + "Proveedor='" + proveedor + "' "
                        + "where Id_Inventario='" + id_Inventario + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Inventario

    //Inicio Update Marca
    public void modificarMarca(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Marca = request.getParameter("id_Marca");
        String nombreMarca = request.getParameter("nombreMarca");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Productos.Marca set "
                        + "NombreMarca='" + nombreMarca + "'"
                        + "Where Id_Marca='" + id_Marca + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Marca
    
    //Inicio Update Productos
    public void modificarProducto(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Producto = request.getParameter("id_Producto");
        String nombreProducto = request.getParameter("nombreProducto");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String id_Inventario = request.getParameter("id_Inventario");
        String id_Marca = request.getParameter("id_Marca");
        String id_Categoria = request.getParameter("id_Categoria");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Productos.Producto set "
                        + "NombreProducto='" + nombreProducto + "',"
                        + "Descripcion='" + descripcion + "',"
                        + "Precio='" + precio + "',"
                        + "Id_Inventario='" + id_Inventario + "',"
                        + "Id_Marca='" + id_Marca + "',"
                        + "Id_Categoria='" + id_Categoria + "'"
                        + "Where Id_Producto='" + id_Producto + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Producto
    
    //Inicio Update Carrito
    public void modificarCarrito(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Carrito = request.getParameter("id_Carrito");
        String id_Producto = request.getParameter("id_Producto");
        String id_Venta = request.getParameter("id_Venta");
        String cantidad = request.getParameter("cantidad");
        String fechaAgregado = request.getParameter("fechaAgregado");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Cliente.CarritoCompras set "
                        + "Id_Producto='" + id_Producto + "',"
                        + "Id_Venta='" + id_Venta + "',"
                        + "Cantidad='" + cantidad+ "',"
                        + "FechaAgregado='" + fechaAgregado + "' "
                        + "Where Id_Carrito='" + id_Carrito + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Carrito
    
    //Inicio Update Compra
    public void modificarCompra(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Compra = request.getParameter("id_Compra");
        String proveedor = request.getParameter("proveedor");
        String nombreCompra = request.getParameter("nombreCompra");
        String fecha_Compra = request.getParameter("fecha_Compra");
        String total = request.getParameter("total");
        String estado = request.getParameter("estado");
        String id_Empleado = request.getParameter("id_Empleado");
        String descripcionCompra = request.getParameter("descripcionCompra");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Ventas.Compra set "
                        + "Proveedor='" + proveedor + "',"
                        + "NombreCompra='" + nombreCompra + "',"
                        + "Fecha_Compra='" + fecha_Compra+ "',"
                        + "Total='" + total + "', "
                        + "Estado='" + estado + "', "
                        + "Id_Empleado='" + id_Empleado + "', "
                        + "DescripcionCompra='" + descripcionCompra + "' "
                        + "Where Id_Compra='" + id_Compra + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Compra
    
    
    //Inicio Update Descuento
    public void modificarDescuento(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Descuento = request.getParameter("id_Descuento");
        String id_Producto = request.getParameter("id_Producto");
        String porcentajeDescuento = request.getParameter("porcentajeDescuento");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFinal = request.getParameter("fechaFinal");
      
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Productos.Descuento set "
                        + "Id_Producto='" + id_Producto + "',"
                        + "PorcentajeDescuento='" + porcentajeDescuento + "',"
                        + "FechaInicio='" + fechaInicio+ "',"
                        + "FechaFinal='" + fechaFinal + "' "
                       
                        + "Where Id_Descuento='" + id_Descuento + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Descuento
    
    //Inicio Update DetalleCompra
    public void modificarDetalleCompra(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_DetalleCompra = request.getParameter("id_DetalleCompra");
        String id_Compra = request.getParameter("id_Compra");
        String cantidad = request.getParameter("cantidad");
        String precioUnitario = request.getParameter("precioUnitario");
        String estadoCompra = request.getParameter("estadoCompra");
        String total = request.getParameter("total");
      
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Ventas.DetalleCompra set "
                        + "Id_Compra='" + id_Compra + "',"
                        + "Cantidad='" + cantidad + "',"
                        + "PrecioUnitario='" + precioUnitario+ "',"
                        + "EstadoCompra='" + estadoCompra + "', "
                        + "Total='" + total + "' "
                       
                        + "Where Id_DetalleCompra='" + id_DetalleCompra + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update DetalleCompra
    
    
    
    
    
    //FUNCIONES DE DELETE ---------------------------------------------------------------
    //Delete Empleado
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from VistaEmpleadoDireccion where Id_Empleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Empleado

    //Delete Cargo
    public void eliminarCargo(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cargo = request.getParameter("id_Cargo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Persona.Cargos where Id_Cargo='" + ID_Cargo + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Cargo

    //Delete Usuarios
    public void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        String ID_Usuario = request.getParameter("id_Usuario");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Rol.Usuarios where Id_Usuario='" + ID_Usuario + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Usuarios

    //Delete Cliente
    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("id_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Cliente.Clientes where Id_Cliente='" + ID_Cliente + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Usuarios

    //Delete Invetario
    public void eliminarInvetario(HttpServletRequest request, HttpServletResponse response) {
        String Id_Inventario = request.getParameter("id_Inventario");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos.Inventario where Id_Inventario='" + Id_Inventario + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Invetario

    //Delete Marca
    public void eliminarMarca(HttpServletRequest request, HttpServletResponse response) {
        String id_Marca = request.getParameter("id_Marca");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos.Marca where Id_Marca='" + id_Marca + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Marca
    
    //Delete Producto
    public void eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        String id_Producto = request.getParameter("id_Producto");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos.Producto where Id_Producto='" + id_Producto + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Producto
    
    //Delete Descuento
    public void eliminarDescuento(HttpServletRequest request, HttpServletResponse response) {
        String id_Descuento = request.getParameter("id_Descuento");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos.Descuento where Id_Descuento='" + id_Descuento + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Descuento
    
    //Delete Compra
    public void eliminarCompra(HttpServletRequest request, HttpServletResponse response) {
        String id_Compra = request.getParameter("id_Compra");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.Compra where Id_Compra='" + id_Compra + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Compra
    
    //Delete Detalle Compra
    public void eliminarDetalleCompra(HttpServletRequest request, HttpServletResponse response) {
        String id_DetalleCompra = request.getParameter("id_DetalleCompra");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.DetalleCompra where Id_DetalleCompra='" + id_DetalleCompra + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Detalle Compra
    
    //Delete Metodos Pago
    public void eliminarMetodosPago(HttpServletRequest request, HttpServletResponse response) {
        String idMetodoPago = request.getParameter("idMetodoPago");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.MetodosPago where Id_MetodoPago='" + idMetodoPago + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Metodos Pago
    
    //Delete Pago
    public void eliminarPago(HttpServletRequest request, HttpServletResponse response) {
        String id_Pago = request.getParameter("id_Pago");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.Pagos where Id_Pago='" + id_Pago + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Pago
    
    //Delete Ventas
    public void eliminarVentas(HttpServletRequest request, HttpServletResponse response) {
        String id_Venta = request.getParameter("id_Venta");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.Venta where Id_Venta='" + id_Venta + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Ventas
    
    //Delete Carrito
    public void eliminarCarrito(HttpServletRequest request, HttpServletResponse response) {
        String id_Carrito = request.getParameter("id_Carrito");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Cliente.CarritoCompras where Id_Carrito='" + id_Carrito + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Carrito
    
    //Delete Detalle Venta
    public void eliminarDetalleVenta(HttpServletRequest request, HttpServletResponse response) {
        String id_DetalleVenta = request.getParameter("id_DetalleVenta");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Ventas.DetalleVenta where Id_DetalleVenta='" + id_DetalleVenta + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Detalle Venta
    
    //Delete Detalle Venta
    public void eliminarGrupo(HttpServletRequest request, HttpServletResponse response) {
        String id_Grupo = request.getParameter("id_Grupo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Grupos.Grupo where Id_Grupo='" + id_Grupo + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Detalle Venta
    
    
    //Delete Detalle Venta
    public void eliminarCategoria(HttpServletRequest request, HttpServletResponse response) {
        String id_Categoria = request.getParameter("id_Categoria");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos.Categoria where Id_Categoria='" + id_Categoria + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Detalle Venta
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("GestionarCargos")) {
            mostrarCargos(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCargos.jsp").forward(request, response);
        } else if (accion.equals("GestionarEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarEmpleados.jsp").forward(request, response);
        } else if (accion.equals("GestionarUsuarios")) {
            mostrarUsuarios(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarUsuarios.jsp").forward(request, response);
        } else if (accion.equals("GestionarClientes")) {
            mostrarClientes(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarClientes.jsp").forward(request, response);
        } else if (accion.equals("GestionarInventario")) {
            mostrarInventario(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarInventario.jsp").forward(request, response);
        } else if (accion.equals("GestionarProductos")) {
            mostrarProducto(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarProductos.jsp").forward(request, response);
        } else if (accion.equals("GestionarDescuento")) {
            mostrarDescuento(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDescuento.jsp").forward(request, response);
        } else if (accion.equals("GestionarCompra")) {
            mostrarCompras(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCompra.jsp").forward(request, response);
        } else if (accion.equals("GestionarDetalleCompra")) {
            mostrarDetallesCompra(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDetalleCompra.jsp").forward(request, response);
        } else if (accion.equals("GestionarMetodosPago")) {
            mostrarMetodosPago(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarMetodosPago.jsp").forward(request, response);
        } else if (accion.equals("GestionarPago")) {
            mostrarPagos(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarPago.jsp").forward(request, response);
        } else if (accion.equals("GestionarVenta")) {
            mostrarVentas(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarVenta.jsp").forward(request, response);
        } else if (accion.equals("GestionarCarritos")) {
            mostrarCarrito(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCarritos.jsp").forward(request, response);
        } else if (accion.equals("GestionarDetalleVentas")) {
            mostrarDetallesVenta(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDetalleVentas.jsp").forward(request, response);
        }else if (accion.equals("GestionarMarca")) {
            mostrarMarca(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarMarca.jsp").forward(request, response);
        }else if (accion.equals("GestionarGrupos")) {
            mostrarGrupo(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarGrupos.jsp").forward(request, response);
        } else if (accion.equals("GestionarCategoria")) {
            mostrarCategoria(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCategoria.jsp").forward(request, response);
        } 
        
        
        else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarEmpleado.jsp").forward(request, response);
        } else if (accion.equals("AgregarCargo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCargo.jsp").forward(request, response);
        } else if (accion.equals("AgregarUsuario")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarUsuario.jsp").forward(request, response);
        } else if (accion.equals("AgregarCliente")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCliente.jsp").forward(request, response);
        }else if (accion.equals("AgregarInventario")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarInventario.jsp").forward(request, response);
        }else if (accion.equals("AgregarMarca")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarMarca.jsp").forward(request, response);
        }else if (accion.equals("AgregarProducto")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarProducto.jsp").forward(request, response);
        }else if (accion.equals("AgregarDescuento")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarDescuento.jsp").forward(request, response);
        }else if (accion.equals("AgregarCompra")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCompra.jsp").forward(request, response);
        }else if (accion.equals("AgregarDetalleCompra")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarDetalleCompra.jsp").forward(request, response);
        }else if (accion.equals("AgregarMetodosPago")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarMetodosPago.jsp").forward(request, response);
        }else if (accion.equals("AgregarPago")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarPago.jsp").forward(request, response);
        }else if (accion.equals("AgregarVenta")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarVenta.jsp").forward(request, response);
        }else if (accion.equals("AgregarCarrito")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCarrito.jsp").forward(request, response);
        }else if (accion.equals("AgregarDetalleVenta")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarDetalleVenta.jsp").forward(request, response);
        }else if (accion.equals("AgregarGrupo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarGrupo.jsp").forward(request, response);
        }else if (accion.equals("AgregarCategoria")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCategoria.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equals("Login")) {
            String Usuario = request.getParameter("tfUsuario");
            String Contrasenia = request.getParameter("tfContrasena");

            try (PrintWriter print = response.getWriter()) {
                if (Usuario.equals("Admin") && Contrasenia.equals("root")) {
                    request.getRequestDispatcher("/index.html").forward(request, response);
                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Error</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1> ERROR: CONTRASEÑA O USUARIO SON ERRONEOS </h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }//fin if 

        //Captura del Post
        if (accion.equals("AgregarEmpleado")) {
            agregarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("AgregarCargo")) {
            agregarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCargo");
        } else if (accion.equals("ModificarCargo")) {
            modificarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("EliminarCargo")) {
            eliminarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("AgregarUsuario")) {
            agregarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarUsuario");
        } else if (accion.equals("ModificarUsuario")) {
            modificarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        } else if (accion.equals("EliminarUsuario")) {
            eliminarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        } else if (accion.equals("AgregarCliente")) {
            agregarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCliente");
        } else if (accion.equals("ModificarCliente")) {
            modificarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
        } else if (accion.equals("EliminarCliente")) {
            eliminarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
        }else if (accion.equals("AgregarInventario")) {
            agregarInventario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarInventario");
        } else if (accion.equals("ModificarInventario")) {
            modificarInventario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarInventario");
        } else if (accion.equals("EliminarInventario")) {
            eliminarInvetario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarInventario");
        }else if (accion.equals("AgregarMarca")) {
            agregarMarca(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarMarca");
        } else if (accion.equals("ModificarMarca")) {
            modificarMarca(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMarca");
        } else if (accion.equals("EliminarMarca")) {
            eliminarMarca(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMarca");
        }else if (accion.equals("AgregarProducto")) {
            agregarProducto(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarProducto");
        } else if (accion.equals("ModificarProducto")) {
            modificarProducto(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarProductos");
        } else if (accion.equals("EliminarProducto")) {
            eliminarProducto(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarProductos");
        }else if (accion.equals("AgregarDescuento")) {
            agregarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarDescuento");
        } else if (accion.equals("ModificarDescuento")) {
           modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDescuento");
        } else if (accion.equals("EliminarDescuento")) {
           eliminarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDescuento");
        }else if (accion.equals("AgregarCompra")) {
            agregarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCompra");
        } else if (accion.equals("ModificarCompra")) {
           modificarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCompra");
        } else if (accion.equals("EliminarCompra")) {
            eliminarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCompra");
        }else if (accion.equals("AgregarDetalleCompra")) {
            agregarDetalleCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarDetalleCompra");
        } else if (accion.equals("ModificarDetalleCompra")) {
           modificarDetalleCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDetalleCompra");
        } else if (accion.equals("EliminarDetalleCompra")) {
            eliminarDetalleCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDetalleCompra");
        }else if (accion.equals("AgregarMetodosPago")) {
            agregarMetodosPago(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarMetodosPago");
        } else if (accion.equals("ModificarMetodosPago")) {
           // modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMetodosPago");
        } else if (accion.equals("EliminarMetodosPago")) {
           eliminarMetodosPago(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarMetodosPago");
        }else if (accion.equals("AgregarPago")) {
            agregarPago(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarPago");
        } else if (accion.equals("ModificarPago")) {
           // modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarPago");
        } else if (accion.equals("EliminarPago")) {
            eliminarPago(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarPago");
        }else if (accion.equals("AgregarVenta")) {
            agregarVenta(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarVenta");
        } else if (accion.equals("ModificarVenta")) {
           // modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarVenta");
        } else if (accion.equals("EliminarVenta")) {
            eliminarVentas(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarVenta");
        }else if (accion.equals("AgregarCarrito")) {
            agregarCarrito(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCarrito");
        } else if (accion.equals("ModificarCarrito")) {
           modificarCarrito(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCarritos");
        } else if (accion.equals("EliminarCarrito")) {
          eliminarCarrito(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCarritos");
        }else if (accion.equals("AgregarDetalleVenta")) {
            agregarDetalleVenta(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarDetalleVenta");
        } else if (accion.equals("ModificarDetalleVenta")) {
           // modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDetalleVentas");
        } else if (accion.equals("EliminarDetalleVenta")) {
            eliminarDetalleVenta(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDetalleVentas");
        }else if (accion.equals("AgregarGrupo")) {
            agregarGrupo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarGrupo");
        } else if (accion.equals("ModificarGrupo")) {
           // modificarDescuento(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarGrupos");
        } else if (accion.equals("EliminarGrupo")) {
           eliminarGrupo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarGrupos");
        }else if (accion.equals("AgregarCategoria")) {
            agregarCategoria(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCategoria");
        } else if (accion.equals("ModificarCategoria")) {
           modificarCategoria(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCategoria");
        } else if (accion.equals("EliminarCategoria")) {
            eliminarCategoria(    request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCategoria");
        }
        

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}