/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author rodri
 */
@WebServlet(name = "Producto", urlPatterns = {"/Producto"})
public class Producto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Producto</title>");    
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css\" integrity=\"sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />");


            out.println("</head>");
            out.println("<body style=\"background-color: #0e9d64\">");
            out.println("<nav class=\"navbar\"  style=\"background-color: maroon; width: 100%;\">");
            out.println("<div class=\"container\">");
            out.println("<a class=\"navbar-brand text-light fs-3\" href=\"#\">Super Mercado</a>");
            out.println("</div>");
            out.println("</nav>");

            String NombreProducto = request.getParameter("nombrep");
            String Descripcion = request.getParameter("descripcion");
            String Precio = request.getParameter("precio");
            String[] Unidades = request.getParameterValues("unidad");
            String[] Categorias = request.getParameterValues("categoria");
            String[] Proveedor = request.getParameterValues("proveedor");
            String Stock = request.getParameter("stock");
            String Ingreso = request.getParameter("ingreso");
            
            out.println("<div class=\"container mt-4 mb-4\" style=\"width:600px \">");
            out.println("<div class=\"card\" style=\"background-color: #6441f3\">");
            out.println("<div class=\"card-body\">");
            out.println("<h2 class=\"card-title\" ><i class=\"fa-solid fa-store fa-bounce\" style=\"color: #050505;\"></i> Datos del Producto</h2>");
            
            out.println("<h4 class=\"card-subtitle  mt-2\">Nombre del producto: " + NombreProducto + "</h3>");
            out.println("<p class=\"card-text mt-2\"> <strong>Descripción del producto: </strong>" + Descripcion + "</p>");
            out.println("<p class=\"card-text\"><strong>Precio del producto: </strong>$" + Precio + "</p>");
            
            out.println("<p class=\"card-text\"><strong>Unidades de Precio:</strong></p>");
            out.println("<ul class=\"list-group\">");
            for (String unidad : Unidades) {
                out.println("<li class=\"list-group-item\">" + unidad + "</li>");
            }
            out.println("</ul>");
            
            out.println("<p class=\"card-text\"><strong>Categorías del producto:</strong></p>");
            out.println("<ul class=\"list-group\">");
            for (String categoria : Categorias) {
                out.println("<li class=\"list-group-item\">" + categoria + "</li>");
            }
            out.println("</ul>");
            
            out.println("<p class=\"card-text\"><strong>Proveedores del producto:</strong></p>");
            out.println("<ul class=\"list-group\">");
            for (String proveedor : Proveedor) {
                out.println("<li class=\"list-group-item\">" + proveedor + "</li>");
            }
            out.println("</ul>");
            
            out.println("<p class=\"card-text mt-3\"><strong>Cantidad en Stock del producto: </strong>" + Stock + "</p>");
            out.println("<p class=\"card-text mt-3\"><strong>Fecha de ingreso del producto: </strong>" + Ingreso + "</p>");
            
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
