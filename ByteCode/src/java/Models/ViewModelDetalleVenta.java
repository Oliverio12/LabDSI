package Models;

public class ViewModelDetalleVenta {
    private int id_DetalleVenta;
    private int id_Venta;
    private String venta;
    private int id_Carrito;
    private String carrito;
    private int id_Producto;
    private String producto;
    private int cantidad;
    private double precioUnitario;
    private double total;

    public ViewModelDetalleVenta() {
    }

    public ViewModelDetalleVenta(int id_DetalleVenta, int id_Venta, String venta, int id_Carrito, String carrito, int id_Producto, String producto, int cantidad, double precioUnitario, double total) {
        this.id_DetalleVenta = id_DetalleVenta;
        this.id_Venta = id_Venta;
        this.venta = venta;
        this.id_Carrito = id_Carrito;
        this.carrito = carrito;
        this.id_Producto = id_Producto;
        this.producto = producto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.total = total;
    }

    public String getVenta() {
        return venta;
    }

    public void setVenta(String venta) {
        this.venta = venta;
    }

    public String getCarrito() {
        return carrito;
    }

    public void setCarrito(String carrito) {
        this.carrito = carrito;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    
    public int getId_DetalleVenta() {
        return id_DetalleVenta;
    }

    public void setId_DetalleVenta(int id_DetalleVenta) {
        this.id_DetalleVenta = id_DetalleVenta;
    }

    public int getId_Venta() {
        return id_Venta;
    }

    public void setId_Venta(int id_Venta) {
        this.id_Venta = id_Venta;
    }

    public int getId_Carrito() {
        return id_Carrito;
    }

    public void setId_Carrito(int id_Carrito) {
        this.id_Carrito = id_Carrito;
    }

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
    
}
