/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.AdminDAO;
import database.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SanPham;
import model.SanPham_Size;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

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
        String hanhdong = request.getParameter("hanhdong");
        if (hanhdong.equals("addProduct")) {
            addProduct(request, response);
        }

    }

    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String masanpham = request.getParameter("masanpham");
            String tensanpham = request.getParameter("tensanpham");
            String hinhanhsanpham = request.getParameter("hinhanhsanpham");
            String mausac = request.getParameter("mausac");
            String kichco = request.getParameter("kichco");
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String kieumau = request.getParameter("kieumau");
            double gianhap = Double.parseDouble(request.getParameter("gianhap"));
            double giaban = Double.parseDouble(request.getParameter("giaban"));
            int giamgia = Integer.parseInt(request.getParameter("giamgia"));
            String mota = request.getParameter("mota");

            SanPham sp = new SanPham(masanpham, tensanpham, hinhanhsanpham,
                    mausac, kichco, soluong, kieumau, gianhap, giaban, giamgia, mota);
            SanPham sp1 = new SanPham(masanpham, kichco, soluong);

            AdminDAO adminDAO = new AdminDAO();
            adminDAO.insertSanPham(sp);
            adminDAO.insertSize(sp1);
            request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
