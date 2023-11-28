/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

public class ViewModelDescuento {

    private int id_Descuento;
    private int id_Producto;
    private String producto;
    private double porcentajeDescuento;
    private Date fechaInicio;
    private Date fechaFinal;

    public ViewModelDescuento(int id_Descuento, int id_Producto, String producto, double porcentajeDescuento, Date fechaInicio, Date fechaFinal) {
        this.id_Descuento = id_Descuento;
        this.id_Producto = id_Producto;
        this.producto = producto;
        this.porcentajeDescuento = porcentajeDescuento;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    
    
    public ViewModelDescuento() {
    }

    public int getId_Descuento() {
        return id_Descuento;
    }

    public void setId_Descuento(int id_Descuento) {
        this.id_Descuento = id_Descuento;
    }

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public double getPorcentajeDescuento() {
        return porcentajeDescuento;
    }

    public void setPorcentajeDescuento(double porcentajeDescuento) {
        this.porcentajeDescuento = porcentajeDescuento;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

}
