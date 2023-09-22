/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletPrincipal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/index.html").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.html").forward(request, response);
        } else if (accion.equals("RegistroEmpleado")) {
            request.getRequestDispatcher("/RegistroEmpleado.html").forward(request, response);
        } else if (accion.equals("RegistroProducto")) {
            request.getRequestDispatcher("/RegistroProducto.html").forward(request, response);
        } else if (accion.equals("RegistroCliente")) {
            request.getRequestDispatcher("/RegistroCliente.html").forward(request, response);
        } else if (accion.equals("RegistroVenta")) {
            request.getRequestDispatcher("/RegistroVenta.html").forward(request, response);
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("Login")) {
            String Usuario = request.getParameter("tfUsuario");
            String Contrasenia = request.getParameter("tfContrasena");

            try (PrintWriter print = response.getWriter()) {
                if (Usuario.equals("Admin") && Contrasenia.equals("root")) {
                    request.getRequestDispatcher("/RegistroCliente.html").forward(request, response);
                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Error</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1> ERROR: CONTRASEÑA O USUARIO SON ERRONEOS </h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
