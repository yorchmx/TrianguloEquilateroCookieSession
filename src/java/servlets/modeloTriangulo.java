/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.Triangulo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Memo
 */
@WebServlet(name = "modeloTriangulo", urlPatterns = {"/modeloTriangulo"})
public class modeloTriangulo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Triangulo clTriangulo = new Triangulo();
            String altura = request.getParameter("txtAltura");
            String base = request.getParameter("txtBase");
            String nombre = request.getParameter("txtNombre");
            clTriangulo.setAltura(Double.parseDouble(altura));
            clTriangulo.setBase(Double.parseDouble(base));
            Double perimetro = clTriangulo.devolverPerimetro();
            Double area = clTriangulo.devolverArea();
            HttpSession sesion = request.getSession(false);
            if(nombre!=null ){
                sesion.setAttribute("nombre", nombre);
            }
            Cookie k = new Cookie("altura",altura);
            response.addCookie(k);
            k = new Cookie("base", base);
            response.addCookie(k);
            k = new Cookie("perimetro",perimetro.toString());
            response.addCookie(k);
            k = new Cookie("area", area.toString());
            response.addCookie(k);
            request.setAttribute("perimetro", perimetro.toString());
            request.setAttribute("area", area.toString());
            request.getRequestDispatcher("/resultado.jsp").forward(request, response);
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
