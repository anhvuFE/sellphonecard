/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Hashing;
//import Model.Category;

/**
 *
 * @author asus
 */
@WebServlet("/accountinfor")
public class AccountInforServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountInforServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountInforServlet at " + request.getContextPath() + "</h1>");
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

        
        HttpSession sess = request.getSession();
        Account account1 = (Account) sess.getAttribute("account");
        if(account1==null){
            response.sendRedirect("login");
            return;
        }
//        String newPass = request.getParameter("pass");
//        String rePass = request.getParameter("rePass");
//        AccountDAO acc = new AccountDAO();
        Hashing has = new Hashing();
        
        String password = account1.getPassword();

        try {
            String decrypt = has.decrypt(password);
            account1.setPassword(decrypt);
        } catch (Exception ex) {
            Logger.getLogger(AccountInforServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("account.jsp").forward(request, response);
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

        HttpSession sess = request.getSession();
        String account = request.getParameter("acc");
        String name = request.getParameter("name");
        String phonex = request.getParameter("phonex");
        AccountDAO acc = new AccountDAO();
        Account account1 = (Account) sess.getAttribute("account");
        account1.setName(name);
        account1.setPhone(phonex);
        // hashing ve mat khau thuong

        // update database
        acc.updateProfile(account, name, phonex);
        request.setAttribute("err2", "update successfull");

        request.getRequestDispatcher("account.jsp").forward(request, response);

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
