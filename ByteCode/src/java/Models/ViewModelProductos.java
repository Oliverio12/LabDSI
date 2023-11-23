/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

public class ViewModelProductos {

    private int id_Producto;
    private String nombreProducto;
    private String descripcion;
    private double precio;
    private int id_Inventario;
    private int id_Marca;
    private int id_Categoria;

    public ViewModelProductos() {
    }

    public ViewModelProductos(int id_Producto, String nombreProducto, String descripcion, double precio, int id_Inventario, int id_Marca, int id_Categoria) {
        this.id_Producto = id_Producto;
        this.nombreProducto = nombreProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.id_Inventario = id_Inventario;
        this.id_Marca = id_Marca;
        this.id_Categoria = id_Categoria;
    }

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
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

    public int getId_Inventario() {
        return id_Inventario;
    }

    public void setId_Inventario(int id_Inventario) {
        this.id_Inventario = id_Inventario;
    }

    public int getId_Marca() {
        return id_Marca;
    }

    public void setId_Marca(int id_Marca) {
        this.id_Marca = id_Marca;
    }

    public int getId_Categoria() {
        return id_Categoria;
    }

    public void setId_Categoria(int id_Categoria) {
        this.id_Categoria = id_Categoria;
    }

}
