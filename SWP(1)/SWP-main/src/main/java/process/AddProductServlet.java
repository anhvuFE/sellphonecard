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
//import Model.Admin;
//import Model.Category;
//import Model.InforUser;
import model.Product;

/**
 *
 * @author asus
 */
public class AddProductServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
//        PrintWriter out = response.getWriter();
//        String hidden = request.getParameter("idxe");
        String proid = request.getParameter("procidx");
        String proname = request.getParameter("proname");
        String prodes = request.getParameter("prodes");
        String procat = request.getParameter("procat");
        String proquanti = request.getParameter("proquanti");
        String proprice = request.getParameter("proprice");
        String proimage = request.getParameter("proimage");
        String submit = request.getParameter("result");
        int rate = 4;
        int price, quantity, x, id = 0, t;

//        try {
//            ProductDAO cdb = new ProductDAO();
//            HttpSession session = request.getSession(false);
//            List<Product> p = cdb.getAll();
////            t = Integer.parseInt(hidden);
//            int size = cdb.getIdMax()+1;
//            InforUser a = (InforUser) session.getAttribute("infor");
//            price = Integer.parseInt(proprice);
//            quantity = Integer.parseInt(proquanti);
//            x = Integer.parseInt(procat);
//
//            Category r = new Category(x, "", "");
//             if("ADD".equals(submit)){
//                Product q = new Product(size, proname, quantity, rate, price, proimage, prodes, r, a.getUsername());
//                int xs = cdb.insert(q);
//                //out.println(xs);
//                response.sendRedirect("myshop");
//            }
//
//        } catch (NumberFormatException e) {
//            System.out.println(e);
//        }

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
