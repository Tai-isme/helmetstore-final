/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.web;

import database.ChiTietDonHangDAO;
import database.DonHangDAO;
import database.GioHangDAO;
import database.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

        try {
            String hanhDong = request.getParameter("hanhdong");
            String maKhachHang = request.getParameter("makhachhang");
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String quocGia = request.getParameter("quocgia");
            String deliveryaddress = request.getParameter("deliveryaddress");
            String paymentMethod = request.getParameter("paymentMethod");
            String voucher = request.getParameter("voucher");
            String ship = request.getParameter("ship");
            String total = request.getParameter("total");
            String soLuongSanPham = request.getParameter("soluongsanpham");

            List<SanPham> productList = new ArrayList<>();

            for (int i = 1;; i++) {
                String maSanPham = request.getParameter("sanpham" + i);
                if (maSanPham == null) {
                    break; // Dừng khi không còn sản phẩm
                }
                String size = request.getParameter("sizesanpham" + i);
                String soLuong = request.getParameter("soluongsanpham" + i);
                String giaTien = request.getParameter("giatiensanpham" + i);

                SanPham sp = new SanPham(maSanPham, size, Integer.parseInt(soLuong) , Double.parseDouble(giaTien));
                productList.add(sp);
            }
            
            // Thêm vào bảng đơn hàng trước
             Random rd = new Random();
            String madonhang = System.currentTimeMillis() + rd.nextInt(1000) + "";
            DonHangDAO donHangDAO = new DonHangDAO();
            donHangDAO.insert(new DonHang(madonhang, maKhachHang));
            for (SanPham sanPham : productList) {
               
               

                // Thêm vào bảng chitietdonhang
                ChiTietDonHangDAO chiTietDonHangDAO = new ChiTietDonHangDAO();
//                ChiTietDonHang chiTietDonHang = new ChiTietDonHang(madonhang, sanPham.getMasanpham(), "Chờ Xử Lý", paymentMethod, Time.getTimeNow(), Time.timeNowPlus_X_minutes(7200), deliveryaddress, sanPham.getSoluong() ) , Double.parseDouble(ship), 10, voucher, Double.parseDouble(total));
                    ChiTietDonHang chiTietDonHang = new ChiTietDonHang(madonhang, sanPham.getMasanpham(), "Chờ xử lý", paymentMethod, Time.getTimeNow(), Time.timeNowPlus_X_minutes(7200), deliveryaddress, sanPham.getSoluong(), Double.parseDouble(ship), 10, voucher, Double.parseDouble(total));
//                ChiTietDonHang chiTietDonHang = new ChiTietDonHang(madonhang, sanPham.getMasanpham(), "Chờ Xử Lý", paymentMethod, Time.getTimeNow(), Time.timeNowPlus_X_minutes(7200)+"", deliveryaddress, sanPham.getSoluong(), ship, voucher, total);
                int soluongdongthaydoi = chiTietDonHangDAO.insert(chiTietDonHang);

                // Giamr số lượng sản phẩm lại
                SanPhamDAO sanPhamDAO = new SanPhamDAO();
                sanPhamDAO.minusPoduct(sanPham.getMasanpham(), sanPham.getKichco(), sanPham.getSoluong());

                // Nếu khách hàng có Login thì xóa khỏi giỏ hành
                GioHangDAO gioHangDAO = new GioHangDAO();
                gioHangDAO.updateAfterPay(new GioHang(maKhachHang, sanPham.getMasanpham(), sanPham.getKichco(), sanPham.getSoluong()));
                String url = "";
                if (soluongdongthaydoi > 0) {
                    url = "/GUI/index.jsp";
                }else{
                    url = "/khachhang/shop.jsp";
                }
                
                request.setAttribute("madonhang", madonhang);
                request.getRequestDispatcher(url).forward(request, response);

            }
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

    private void chuyenquacheckout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

    }

}