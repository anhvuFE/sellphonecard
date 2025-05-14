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
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import model.Product;

/**
 *
 * @author asus
 */
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        String start = request.getParameter("searchhome");
        List<Product> p = new ArrayList<Product>();
//        try {
//            if (start != null && start != "") {
//                ProductDAO cdb = new ProductDAO();
//                List<Product> c = cdb.getAll();
//                if (c != null) {
//                    for (Product product : c) {
//                        String temp = Normalizer.normalize(product.getName(), Normalizer.Form.NFD);
//                        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
//                        String s = pattern.matcher(temp).replaceAll("");
//                        String temp2 = Normalizer.normalize(start, Normalizer.Form.NFD);
//                        Pattern pattern2 = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
//                        String s2 = pattern.matcher(temp2).replaceAll("");
////                    request.setAttribute("sl", s2);
//                        if (s.toLowerCase().contains(s2.toLowerCase())) {
//                            p.add(product);
//                        }
//                    }
//
//                }
//                request.setAttribute("sl", p.size());
//                request.setAttribute("resultpro", p);
//            } else {
//                request.setAttribute("sl", 0);
//            }
//
//        } catch (NumberFormatException e) {
//            System.out.println(e);
//        }
        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
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

        String start = request.getParameter("procat");
        String start2 = request.getParameter("votesel");
        String start3 = request.getParameter("pricemax");
        List<Product> p = new ArrayList<Product>();
        List<Product> q = new ArrayList<Product>();
        int id = 0;
//        if (!"--".equals(start)) {
//            try {
//                id = Integer.parseInt(start);
//                p = prdao.getProductsByCid(id);
//                if (!"--".equals(start2)) {
//                    switch (start2) {
//                        case "4":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 4) {
//                                   q.add(pq);
//                                }
//                            }
//                            break;
//                        case "3":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 3) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "2":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 2) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "1":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 1) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//
//                        default:
//                            break;
//                    }
//                }
//                if (!"--".equals(start3)) {
//                    switch (start3) {
//                        
//                        case "2":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 1000000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "3":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 500000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "4":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 200000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "5":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 100000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        default:
//                            break;
//                    }
//                }
//
//            } catch (NumberFormatException e) {
//                System.out.println(e);
//            }
//        } else {
//            try {
//                if (!"--".equals(start2)) {
//                    switch (start2) {
//                        case "4":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 4) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "3":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 3) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "2":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 2) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "1":
//                            for (Product pq : p) {
//                                if (pq.getRate() > 1) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//
//                        default:
//                            break;
//                    }
//                }
//                if (!"--".equals(start3)) {
//                    switch (start3) {
//                        
//                        case "2":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 1000000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "3":
//                            for (Product pq : p) {
//                                if (pq.getPrice() < 500000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "4":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 200000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        case "5":
//                            for (Product pq : p) {
//                                if (pq.getPrice() > 100000) {
//                                    q.add(pq);
//                                }
//                            }
//                            break;
//                        default:
//                            break;
//                    }
//                }
//
//            } catch (NumberFormatException e) {
//                System.out.println(e);
//            }
//        }
//        if (q != null) {
//            request.setAttribute("sl", q.size());
//            request.setAttribute("resultpro",q);
//            
//        } 
//
//        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
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
