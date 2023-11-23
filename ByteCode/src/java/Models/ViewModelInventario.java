package Models;

import java.util.Date;

public class ViewModelInventario {
    private int id_Inventario;
    private int stock;
    private String nombreProducto;
    private String descripcion;
    private double precio;
    private Date fechaAdquisicion;
    private Date fechaUltimaActualizacion;
    private String categoria;
    private String proveedor;

    public ViewModelInventario() {
    }

    public ViewModelInventario(int id_Inventario, int stock, String nombreProducto, String descripcion, double precio, Date fechaAdquisicion, Date fechaUltimaActualizacion, String categoria, String proveedor) {
        this.id_Inventario = id_Inventario;
        this.stock = stock;
        this.nombreProducto = nombreProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.fechaAdquisicion = fechaAdquisicion;
        this.fechaUltimaActualizacion = fechaUltimaActualizacion;
        this.categoria = categoria;
        this.proveedor = proveedor;
    }

    public int getId_Inventario() {
        return id_Inventario;
    }

    public void setId_Inventario(int id_Inventario) {
        this.id_Inventario = id_Inventario;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Date getFechaAdquisicion() {
        return fechaAdquisicion;
    }

    public void setFechaAdquisicion(Date fechaAdquisicion) {
        this.fechaAdquisicion = fechaAdquisicion;
    }

    public Date getFechaUltimaActualizacion() {
        return fechaUltimaActualizacion;
    }

    public void setFechaUltimaActualizacion(Date fechaUltimaActualizacion) {
        this.fechaUltimaActualizacion = fechaUltimaActualizacion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
    
    
    
}
