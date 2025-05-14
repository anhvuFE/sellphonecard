/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dao.AccountDAO;
import dao.ListBuyOfShopDAO;
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
import model.Product;

/**
 *
 * @author PC
 */
@WebServlet("/login")

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("signUp") != null) {
            request.getRequestDispatcher("login/register.jsp").forward(request, response);
        }
        if (request.getParameter("forgotPass") != null) {
            request.getRequestDispatcher("login/rePass.jsp").forward(request, response);
        }
        HttpSession sess = request.getSession();
        sess.removeAttribute("account");
        request.getRequestDispatcher("login/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check what button is clicked
        if (request.getParameter("login") != null) {
            //get user input form jsp
            String acc = request.getParameter("account");
            String pass = request.getParameter("pass");
            
            String captchaInput = request.getParameter("captcha");
            //get captcha from servlet
            HttpSession sess = request.getSession();
            String captcha = (String) sess.getAttribute("captcha");
            boolean checkCaptcha = false;
            if (captcha.equals(captchaInput)) {
                checkCaptcha = true;
            } else {
                request.setAttribute("acc", acc);
                request.setAttribute("pass", pass);
                
                String err = "captcha invalid";
                request.setAttribute("err", err);
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            }

            //check activation
            AccountDAO accountDao = new AccountDAO();
            Account account = accountDao.findAccount(acc);
            boolean isAcitive = false;
            if (account != null) {
                isAcitive = account.isActive();
            }
            //check if login is valid
            boolean checkAccount = isValidLogin(account, pass);
            if (isAcitive && checkAccount && checkCaptcha) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                //sending list product to home
                ListBuyOfShopDAO lb = new ListBuyOfShopDAO();
                List<Product> suppliers = lb.getAllSupplier();
                request.setAttribute("suppliers", suppliers);
                List<Product> products = lb.getAllProduct();
                request.setAttribute("products", products);
                //move to home page
                if (account.getRoleId() == 1) {
                    request.setAttribute("check", 1);
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                } else if (account.getRoleId() == 2) {
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
            } else {
                String err = "Wrong account or password";
                if (!checkCaptcha) {
                    err = "captcha invalid";
                }
                request.setAttribute("err", err);
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            }
        }

    }

    /**
     * Kiểm tra tính hợp lệ của thông tin đăng nhập.
     */
    private boolean isValidLogin(Account account, String pass) {

        if (account != null) {
            // Nếu tài khoản tồn tại, so sánh mật khẩu đã nhập với mật khẩu đã được mã hóa.
            Hashing hashing = new Hashing();
            String encryptedPassword = account.getPassword();

            try {
                String decryptedPassword = hashing.decrypt(encryptedPassword);

                if (decryptedPassword.equals(pass)) {
                    return true;
                }
            } catch (Exception ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

}
