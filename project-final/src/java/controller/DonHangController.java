/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.ChiTietDonHangDAO;
import database.DonHangDAO;
import database.GioHangDAO;
import database.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ChiTietDonHang;
import model.DonHang;
import model.GioHang;
import model.KhachHang;
import model.SanPham;
import utils.Time;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DonHangController", urlPatterns = {"/don-hang"})
public class DonHangController extends HttpServlet {

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
        String action = request.getParameter("hanhdong");
        if (action.equals("saveDonHang")) {
            saveDonHang(request, response);
        }
    }

    private void saveDonHang(HttpServletRequest request, HttpServletResponse response) {
        String url = "/GUI/index.jsp";
        DonHang dh = null;

        String makhachhang = request.getParameter("makhachhang");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String quocgia = request.getParameter("quocgia");
        String delivery = request.getParameter("delivery");
        String paymentMethod = request.getParameter("paymentMethod");
        String soluongsanphamstr = request.getParameter("soluongsanpham");
        int soluongsanpham = Integer.parseInt(soluongsanphamstr);

        String trangthaidonhang = "Da dat hang";
        String trangthaithanhtoan = "Chua thanh toan";
        double tienvanchuyen = 30;
        int vat = 5;

        List<String> sanphamList = new ArrayList<>();

        for (int i = 1; i <= soluongsanpham + 1; i++) {
            String sanpham = request.getParameter("sanpham" + i);
            if (sanpham != null) {
                sanphamList.add(sanpham);
            }
        }

        try {
            HttpSession session = request.getSession();
            // Tạo ra mã don hang
            Random rd = new Random();
            String madonhang = System.currentTimeMillis() + rd.nextInt(1000) + "";

            for (String string : sanphamList) {
                GioHangDAO ghd = new GioHangDAO();
                GioHang temp = ghd.selectByMaSanPham(string);

                SanPhamDAO sanPhamDAO = new SanPhamDAO();
                SanPham sp = sanPhamDAO.selectById(temp.getMasanpham());

                double tongtienSanPham = temp.getSoluong() * sp.getGiaban();

                double vatAmount = tongtienSanPham * (vat / 100);
                double total = tongtienSanPham + ((double) tongtienSanPham * 0.05);

                DonHangDAO dhd = new DonHangDAO();
                dh = new DonHang(madonhang, makhachhang, temp.getMasanpham());
                dhd.insert(dh);

                ChiTietDonHang ctdh = new ChiTietDonHang(madonhang, temp.getMasanpham(), trangthaidonhang, paymentMethod, trangthaithanhtoan,
                        Time.getTimeNow(), Time.timeNowPlus_X_minutes(7200), soluongsanphamstr, temp.getSoluong(), tienvanchuyen, vat, total);

                ChiTietDonHangDAO ctdhdao = new ChiTietDonHangDAO();

                if (ctdhdao.insert(ctdh) > 0) {
                    url = "/khachhang/checkoutdetails.jsp";
                }
                ghd.deleteproductoutcart(temp);
                request.setAttribute("madonhang", madonhang);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
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

    private void chuyenquacheckout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
//        List(G)
    }

}
