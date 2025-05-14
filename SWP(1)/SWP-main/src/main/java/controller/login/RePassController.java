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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author caoqu
 */
@WebServlet(name = "rePassController", urlPatterns = {"/rePass"})
public class RePassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get user input form jsp
        String acc = request.getParameter("account");
        String captchaInput = request.getParameter("captcha");
        HttpSession sess = request.getSession();
        String captcha = (String) sess.getAttribute("captcha");
        // check userName exist?
        AccountDAO a = new AccountDAO();
        boolean checkAccount = false;
        Account account = a.findAccount(acc);
        String mail = "", newPass = "";
        if (account != null) {
            checkAccount = true;
            mail = account.getEmail();
        } else {
            request.setAttribute("err", "account not exist");
            request.getRequestDispatcher("login/rePass.jsp").forward(request, response);
            return;
        }
        sess.setAttribute("repassAccount", account);
        sess.setAttribute("userName", account.getUserName());

        if (captcha.equals(captchaInput) && checkAccount == true) {
            // SendMail
            String title = "update password";
            CapchaDAO rand = new CapchaDAO();
            newPass = rand.getCapcha();
            sess.setAttribute("otp", newPass);
            String content = "your otp is " + newPass;
//            SendingMailDAO sendMail = new SendingMailDAO();
//            boolean send = sendMail.SendingMail(response, request, mail, title, content);
            SendingMailDAO sendMail = new SendingMailDAO(response, request, mail, title, content);
            Thread thread = new Thread(sendMail);
            thread.start();
            request.getRequestDispatcher("login/OTP.jsp").forward(request, response);
        }
        //display new pass to check
    }

}
