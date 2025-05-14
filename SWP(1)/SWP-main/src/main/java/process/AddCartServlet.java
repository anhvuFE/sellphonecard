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
import model.Product;

/**
 *
 * @author asus
 */
public class AddCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCartServlet at " + request.getContextPath() + "</h1>");
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
//        String id_raw = request.getParameter("idproc");
//        String quanti = request.getParameter("quantity");
////        String quanti = request.getParameter("quantity");
//        int id, quantity;
//        CartDAO cdb = new CartDAO();
//        HttpSession session = request.getSession();
//        InforUser iu = (InforUser) session.getAttribute("infor");
//        try {
//            id = Integer.parseInt(id_raw);
//            if (quanti == null) {
//                quantity = 1;
//            } else {
//                quantity = Integer.parseInt(quanti);
//            }
//
//            Cart ct = cdb.getCartByIdProcductAndUser(iu.username, id);
//            //response.sendRedirect("list");
//
//            if (ct == null) {
//                Product p = new Product();
//                p.setId(id);
//                int i = cdb.getIdMaxCart();
//                Cart c = new Cart(i+1,iu.username, quantity, p);
//                cdb.insert(c);
//                List<Cart> cart = cdb.getCart(iu.username);
//                session.setAttribute("sizecart", cart.size());
//                response.sendRedirect("cart");
//            } else {
//                int i = cdb.getCartByIdProcductAndUser(iu.username, id).getId();
//                cdb.updateCart(i,iu.username, id, ct.getQuantity() + quantity);
//                response.sendRedirect("cart");
//            }
//
//            //request.getRequestDispatcher("cart.jsp").forward(request, response);
//        } catch (NumberFormatException e) {
//            System.out.println(e);
//        }

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
