package Models;

public class ViewModelCategoria {
    private int id_Categoria;
    private String nombreCategoria;

    public ViewModelCategoria(int id_Categoria, String nombreCategoria) {
        this.id_Categoria = id_Categoria;
        this.nombreCategoria = nombreCategoria;
    }

    public ViewModelCategoria() {
    }

    public int getId_Categoria() {
        return id_Categoria;
    }

    public void setId_Categoria(int id_Categoria) {
        this.id_Categoria = id_Categoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }
    
    
    
}
