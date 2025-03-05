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
import javax.servlet.http.HttpSession;
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/khachhang/login.jsp");
            return;
        }
        String hanhdong = request.getParameter("hanhdong");
        if (hanhdong == null || hanhdong.isEmpty()) {
//            login(request, response);
        } else if (hanhdong.equals("load")) {
            loadAllSanPham(request, response);
        } else if (hanhdong.equals("create")) {
            create(request, response);
        } else if (hanhdong.equals("addProduct")) {
            addProduct(request, response);
        } else if (hanhdong.equals("delete")) {
            delete(request, response);
        } else if (hanhdong.equals("edit")) {
            edit(request, response);
        } else if (hanhdong.equals("update")) {
            update(request, response);
        }
    }

    private void loadAllSanPham(HttpServletRequest request, HttpServletResponse response) {
        List<SanPham> spList = new ArrayList<SanPham>();
        try {
            AdminDAO adao = new AdminDAO();
            spList = adao.selectAllSanPham();
            if (spList != null) {

                request.setAttribute("spList", spList);
            }
            request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            SanPham sp = new SanPham();

            request.setAttribute("nextaction", "addProduct");
            request.setAttribute("sp", sp);
            response.sendRedirect(request.getContextPath() + "/admin/addproduct.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
            response.sendRedirect("/project-final/admin?hanhdong=load");
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

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            String masanpham = request.getParameter("masanpham");
            String size = request.getParameter("size");
            System.out.println(masanpham);
            System.out.println(size);
            AdminDAO adao = new AdminDAO();
            SanPham sp = new SanPham();

            sp.setMasanpham(masanpham);
            sp.setKichco(size);

            if (sp != null) {
                if (adao.deleteSanPhamSize(sp) == true) {
                    adao.delete(sp);
                }
                System.out.println("Xoa thanh cong");
            }
            response.sendRedirect("/project-final/admin?hanhdong=load");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            String massanpham = request.getParameter("masanpham");
            SanPhamDAO sdao = new SanPhamDAO();
            SanPham sp = sdao.selectById(massanpham);
            if (sp != null) {
                request.setAttribute("sp", sp);
                request.setAttribute("nextaction", "update");
                request.getRequestDispatcher("/admin/updateproductdetails.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
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
        try {
            SanPham sp = new SanPham(masanpham, tensanpham, hinhanhsanpham, mausac, kieumau, gianhap, giaban, giamgia, mota);
            SanPham sp1 = new SanPham(masanpham, mota, soluong);
            AdminDAO adao = new AdminDAO();
            if (adao.updateSanPham(sp) == true) {
                adao.updateSanPhamSize(sp1);
            }
            response.sendRedirect("/project-final/admin?hanhdong=load");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
