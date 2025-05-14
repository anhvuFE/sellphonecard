/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dao.AccountDAO;
import dao.SendingMailDAO;
import dao.CapchaDAO;
import model.Account;
import model.Hashing;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDateTime;
import java.util.Date;
import jxl.write.DateTime;

/**
 *
 * @author PC
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {

    public static final String FiLE_TYPE = "jpeg";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        //data recive from jsp
        String account = request.getParameter("account");
        String pass = request.getParameter("pass");
        String reciveEmail = request.getParameter("email");

        String capchaInput = request.getParameter("captcha");

        //hashing password
        Hashing hashing = new Hashing();
        String encryptPass = "";
        try {
            encryptPass = hashing.encrypt(pass);
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession sess = request.getSession();
        //check valid acc
        AccountDAO a = new AccountDAO();
        List<Account> listA = a.listAll();
        boolean checkValid = false;
        for (Account a1 : listA) {
            if (a1.getUserName().equals(account)) {
                checkValid = true;
            }
        }

        //sending mail
//        SendingMailDAO sendMail = new SendingMailDAO();
        CapchaDAO random = new CapchaDAO();
        //sending ma xac nhan to authen servlet
        String maXacNhan = random.getCapcha();
        //account add
        Date d = new Date();
        Account acc = new Account(account, encryptPass, reciveEmail,
                "", "", 2, 100000.0, d, d, false);
        sess.setAttribute("registerAccount", acc);

        //lay captcha tu session
        String capchaAnswer = (String) sess.getAttribute("captcha");
        //check valid captcha
        boolean checkCaptcha = capchaAnswer.equals(capchaInput);
        if (!checkCaptcha) {
            request.setAttribute("acc_re", account);
            request.setAttribute("pass_re", pass);
            request.setAttribute("email_re", reciveEmail);
            
            String notice = "captcha failed ";
            request.setAttribute("notice", notice);
            request.getRequestDispatcher("login/register.jsp").forward(request, response);
        }
        //thong bao sau khi ko thoa man dk
        String notice = "";
        if (checkCaptcha && !checkValid) {
            //set content and title mail
            String title = "authentication";
            String content = "ma xac nhan: " + maXacNhan;
            SendingMailDAO sendMail = new SendingMailDAO(response, request, reciveEmail, title, content);
            Thread thread = new Thread(sendMail);
            thread.start();
            sess.setAttribute("maXacNhan", maXacNhan);
            //add du lieu
            a.addAccount(acc);
            request.getRequestDispatcher("login/authentication.jsp").forward(request, response);
        } else {
            if (!checkCaptcha) {
                notice += "captcha failed ";
            }
            if (checkValid) {
                notice += "account exsit ";
            }
            request.setAttribute("notice", notice);
            request.getRequestDispatcher("login/register.jsp").forward(request, response);
        }
    }
}
