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
    

    public ViewModelEmpleados() {
    }

    public ViewModelEmpleados(int id_Empleado, String dui_Empleado, int isss_Empleado, String nombresEmpleado, String apellidosEmpleado, Date fechaNacEmpleado, String telefono, String correo) {
        this.id_Empleado = id_Empleado;
        this.dui_Empleado = dui_Empleado;
        this.isss_Empleado = isss_Empleado;
        this.nombresEmpleado = nombresEmpleado;
        this.apellidosEmpleado = apellidosEmpleado;
        this.fechaNacEmpleado = fechaNacEmpleado;
        this.telefono = telefono;
        this.correo = correo;
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

    
}
