package Models;


public class ViewModelGrupos {
    private int id_Grupo;
    private int id_Empleado;
    private String turno;

    public ViewModelGrupos(int id_Grupo, int id_Empleado, String turno) {
        this.id_Grupo = id_Grupo;
        this.id_Empleado = id_Empleado;
        this.turno = turno;
    }
    public ViewModelGrupos() {
    }

    public int getId_Grupo() {
        return id_Grupo;
    }

    public void setId_Grupo(int id_Grupo) {
        this.id_Grupo = id_Grupo;
    }

    public int getId_Empleado() {
        return id_Empleado;
    }

    public void setId_Empleado(int id_Empleado) {
        this.id_Empleado = id_Empleado;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }
    
    
    
}
