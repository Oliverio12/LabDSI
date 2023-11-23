package Models;

public class ViewModelUsuarios {
    private int id_Usuario;
    private int id_Empleado;
    private int id_Rol;
    private String usuario;
    private String clave;

    public ViewModelUsuarios() {
    }

    public ViewModelUsuarios(int id_Usuario, int id_Empleado, int id_Rol, String usuario, String clave) {
        this.id_Usuario = id_Usuario;
        this.id_Empleado = id_Empleado;
        this.id_Rol = id_Rol;
        this.usuario = usuario;
        this.clave = clave;
    }

    public int getId_Usuario() {
        return id_Usuario;
    }

    public void setId_Usuario(int id_Usuario) {
        this.id_Usuario = id_Usuario;
    }

    public int getId_Empleado() {
        return id_Empleado;
    }

    public void setId_Empleado(int id_Empleado) {
        this.id_Empleado = id_Empleado;
    }

    public int getId_Rol() {
        return id_Rol;
    }

    public void setId_Rol(int id_Rol) {
        this.id_Rol = id_Rol;
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

    
    
    
}
