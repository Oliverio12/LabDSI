/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author rodri
 */
public class ViewModelClientes {
    
    private int id_Cliente;
    private String nombresCliente;
    private String apellidosCliente;
    private String duiCliente;
    private String telefono;
    private String correo;
    private int id_Direccion;
    private String direccionCompleta;
    private String usuario;
    private String clave;
    private String fechaRegistro;

    public ViewModelClientes() {
    }

    public ViewModelClientes(int id_Cliente, String nombresCliente, String apellidosCliente, String duiCliente, String telefono, String correo, int id_Direccion, String direccionCompleta, String usuario, String clave, String fechaRegistro) {
        this.id_Cliente = id_Cliente;
        this.nombresCliente = nombresCliente;
        this.apellidosCliente = apellidosCliente;
        this.duiCliente = duiCliente;
        this.telefono = telefono;
        this.correo = correo;
        this.id_Direccion = id_Direccion;
        this.direccionCompleta = direccionCompleta;
        this.usuario = usuario;
        this.clave = clave;
        this.fechaRegistro = fechaRegistro;
    }

    public String getDireccionCompleta() {
        return direccionCompleta;
    }

    public void setDireccionCompleta(String direccionCompleta) {
        this.direccionCompleta = direccionCompleta;
    }

   

    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public String getNombresCliente() {
        return nombresCliente;
    }

    public void setNombresCliente(String nombresCliente) {
        this.nombresCliente = nombresCliente;
    }

    public String getApellidosCliente() {
        return apellidosCliente;
    }

    public void setApellidosCliente(String apellidosCliente) {
        this.apellidosCliente = apellidosCliente;
    }

    public String getDuiCliente() {
        return duiCliente;
    }

    public void setDuiCliente(String duiCliente) {
        this.duiCliente = duiCliente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getId_Direccion() {
        return id_Direccion;
    }

    public void setId_Direccion(int id_Direccion) {
        this.id_Direccion = id_Direccion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    
    
    
}
