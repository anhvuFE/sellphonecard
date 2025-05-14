/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dao.AccountDAO;
import dao.SendingMailDAO;
import dao.CapchaDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author caoqu
 */
@WebServlet(name = "AuthenticationServlet", urlPatterns = {"/authen"})
public class AuthenticationServlet extends HttpServlet {

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
            out.println("<title>Servlet AuthenticationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthenticationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();
        //sending mail 
        CapchaDAO random = new CapchaDAO();
        //sending ma xac nhan to authen servlet
        String maXacNhan = random.getCapcha();
        sess.setAttribute("maXacNhan", maXacNhan);
        Account acc = (Account) sess.getAttribute("registerAccount");
        String reciveEmail = acc.getEmail();
        //set content and title mail
        String title = "authentication";
        String content = "cap lai ma xac nhan " + maXacNhan;
        SendingMailDAO sendMail = new SendingMailDAO(response, request, reciveEmail, title, content);
        Thread thread = new Thread(sendMail);
        thread.start();

        request.getRequestDispatcher("login/authentication.jsp").forward(request, response);
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
        //get user input from jsp
        String maXacThuc = request.getParameter("ma");

        //lay captcha cua servlet
        //lay ma xac thuc luu o servlet
        HttpSession sess = request.getSession();
        String xacThuc = (String) sess.getAttribute("maXacNhan");//in registerControler

        String err = "";
        if (!maXacThuc.equals(xacThuc)) {
            //neu ma xac thuc sai tra lai trang cu
            err = "ma xac thuc sai";
            request.setAttribute("err", err);
            request.getRequestDispatcher("login/authentication.jsp").forward(request, response);
            return;
        }
        //neu ma xac thuc va captcha deu dung tra lai trang login
        AccountDAO a = new AccountDAO();
        Account acc = (Account) sess.getAttribute("registerAccount");
        a.updateStatusAccount(acc.getUserName());
        request.setAttribute("err", "Xac thuc thanh cong");
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
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
