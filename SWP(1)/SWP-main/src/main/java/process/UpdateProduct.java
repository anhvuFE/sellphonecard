/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package process;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
//import Model.Category;
//import Model.InforUser;
import model.Product;

/**
 *
 * @author asus
 */
public class UpdateProduct extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String proid = request.getParameter("procidx1");
        String proname = request.getParameter("proname1");
        String prodes = request.getParameter("prodes1");
        String procat = request.getParameter("procat1");
        String proquanti = request.getParameter("proquanti1");
        String proprice = request.getParameter("proprice1");
        String proimage = request.getParameter("proimage1");
        String submit = request.getParameter("result1");
        int rate = 4;
        int price, quantity, x, id = 0, t;

//        try {
//            ProductDAO cdb = new ProductDAO();
//            HttpSession session = request.getSession(false);
//            int size = cdb.getIdMax()+1;
//            InforUser a = (InforUser) session.getAttribute("infor");
//            price = Integer.parseInt(proprice);
//            quantity = Integer.parseInt(proquanti);
//            x = Integer.parseInt(procat);
//
//            Category r = new Category(x, "", "");
//            if("UPDATE".equals(submit)) {
//                id = Integer.parseInt(proid);
//                if (id > 0 && id < size) {
//
//                Product q = new Product(id, proname, quantity, rate, price, proimage, prodes, r, a.getUsername());
//                cdb.update(q);
//                //out.println(id);
//                response.sendRedirect("myshop");
//                }
//            } 
//            
//        } catch (NumberFormatException e) {
//            System.out.println(e);
//        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
