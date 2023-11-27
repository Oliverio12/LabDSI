package Models;



import java.util.Date;


public class ViewModelEmpleados {

    private int id_Empleado;
    private String dui_Empleado;
    private int isss_Empleado;
    private String nombresEmpleado;
    private String apellidosEmpleado;
    private Date fechaNacEmpleado;
    private String telefono;
    private String correo;
    private int id_Cargo;
    private String cargo;
    private int id_Direccion;
    private String direccionCompleta;
    

    public ViewModelEmpleados() {
    }

    public ViewModelEmpleados(int id_Empleado, String dui_Empleado, int isss_Empleado, String nombresEmpleado, String apellidosEmpleado, Date fechaNacEmpleado, String telefono, String correo, int id_Cargo, String cargo, int id_Direccion, String direccionCompleta) {
        this.id_Empleado = id_Empleado;
        this.dui_Empleado = dui_Empleado;
        this.isss_Empleado = isss_Empleado;
        this.nombresEmpleado = nombresEmpleado;
        this.apellidosEmpleado = apellidosEmpleado;
        this.fechaNacEmpleado = fechaNacEmpleado;
        this.telefono = telefono;
        this.correo = correo;
        this.id_Cargo = id_Cargo;
        this.cargo = cargo;
        this.id_Direccion = id_Direccion;
        this.direccionCompleta = direccionCompleta;
    }

    public int getId_Empleado() {
        return id_Empleado;
    }

    public void setId_Empleado(int id_Empleado) {
        this.id_Empleado = id_Empleado;
    }

    public String getDui_Empleado() {
        return dui_Empleado;
    }

    public void setDui_Empleado(String dui_Empleado) {
        this.dui_Empleado = dui_Empleado;
    }

    public int getIsss_Empleado() {
        return isss_Empleado;
    }

    public void setIsss_Empleado(int isss_Empleado) {
        this.isss_Empleado = isss_Empleado;
    }

    public String getNombresEmpleado() {
        return nombresEmpleado;
    }

    public void setNombresEmpleado(String nombresEmpleado) {
        this.nombresEmpleado = nombresEmpleado;
    }

    public String getApellidosEmpleado() {
        return apellidosEmpleado;
    }

    public void setApellidosEmpleado(String apellidosEmpleado) {
        this.apellidosEmpleado = apellidosEmpleado;
    }

    public Date getFechaNacEmpleado() {
        return fechaNacEmpleado;
    }

    public void setFechaNacEmpleado(Date fechaNacEmpleado) {
        this.fechaNacEmpleado = fechaNacEmpleado;
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

    public int getId_Cargo() {
        return id_Cargo;
    }

    public void setId_Cargo(int id_Cargo) {
        this.id_Cargo = id_Cargo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getId_Direccion() {
        return id_Direccion;
    }

    public void setId_Direccion(int id_Direccion) {
        this.id_Direccion = id_Direccion;
    }

    public String getDireccionCompleta() {
        return direccionCompleta;
    }

    public void setDireccionCompleta(String direccionCompleta) {
        this.direccionCompleta = direccionCompleta;
    }

    
    
}
