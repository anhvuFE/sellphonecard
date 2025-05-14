/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

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

/**
 *
 * @author Administrator
 */
@WebServlet(name = "NewPassController", urlPatterns = {"/newPass"})
public class NewPassController extends HttpServlet {

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
            out.println("<title>Servlet NewPassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPassController at " + request.getContextPath() + "</h1>");
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
        HttpSession sess = request.getSession();
        Account account = (Account) sess.getAttribute("repassAccount");
        Account account1 = (Account) sess.getAttribute("account");
        String newPass = request.getParameter("pass");
        String rePass = request.getParameter("rePass");
        AccountDAO acc = new AccountDAO();

        if (newPass.equals(rePass)) {
            
            Hashing hashing = new Hashing();
            String encrytedPass = "";
            try {
                encrytedPass = hashing.encrypt(rePass);
            } catch (Exception ex) {
                Logger.getLogger(NewPassController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if (request.getParameter("mode") != null) {
                acc.updateNewPass(account1.getUserName(), encrytedPass);
                request.setAttribute("err1", "change password successfull");
                request.getRequestDispatcher("account.jsp").forward(request, response);
            } else {
                acc.updateNewPass(account.getUserName(), encrytedPass);
                request.setAttribute("err", "change password successfull");
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            }
        } else {
            if (request.getParameter("mode") != null) {
                request.setAttribute("err1", "pass and re-pass not equals");
                request.getRequestDispatcher("account.jsp").forward(request, response);
            } else {
                request.setAttribute("err", "pass and re-pass not equals");
                request.getRequestDispatcher("login/changePassword.jsp").forward(request, response);
            }
        }

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
