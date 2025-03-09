/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ChiTietDonHang;
import model.GioHang;
import utils.JDBCUtil;
import utils.Time;

/**
 *
 * @author Admin
 */
public class ChiTietDonHangDAO {

    public int insert(ChiTietDonHang ctdh) throws SQLException {
        int result = 0;
        

        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO chitietdonhang VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ctdh.getMaDonHang());
            ps.setString(2, ctdh.getMaSanPham());
            ps.setString(3, ctdh.getTrangThaiDonHang());
            ps.setString(4, ctdh.getPhuongThucThanhToan());
            ps.setString(5, ctdh.getNgayDatHang());
            ps.setString(6, ctdh.getNgayGiaoHangDuKien());
            ps.setString(7, ctdh.getDiaChiGiaoHang());
            ps.setInt(8, ctdh.getSoLuongSanPhamMua());
            ps.setDouble(9, ctdh.getTienVanChuyen());
            ps.setInt(10, ctdh.getVat());
            ps.setString(11, ctdh.getMagiamgia());
            ps.setDouble(12, ctdh.getTongTien());
            result = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ChiTietDonHang select(String madonhang) throws SQLException {
        ChiTietDonHang ketQua = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " SELECT * \n"
                    + " FROM chitietdonhang\n"
                    + " WHERE madonhang = ? ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, madonhang);

            ResultSet rs = ps.executeQuery();

            

            JDBCUtil.close(con);

        } catch (Exception e) {
        }

        return ketQua;
    }

    public static void main(String[] args) {
        try {
            ChiTietDonHangDAO dao = new ChiTietDonHangDAO();
            ChiTietDonHang chiTietDonHang = dao.select("1740907669030");

            if (chiTietDonHang != null) {
                System.out.println("Mã đơn hàng: " + chiTietDonHang.getMaDonHang());
                System.out.println("Mã sản phẩm: " + chiTietDonHang.getMaSanPham());
                System.out.println("Trạng thái đơn hàng: " + chiTietDonHang.getTrangThaiDonHang());
                System.out.println("Phương thức thanh toán: " + chiTietDonHang.getPhuongThucThanhToan());
            
                System.out.println("Ngày đặt hàng: " + chiTietDonHang.getNgayDatHang());
                System.out.println("Ngày giao hàng dự kiến: " + chiTietDonHang.getNgayGiaoHangDuKien());
                System.out.println("Địa chỉ giao hàng: " + chiTietDonHang.getDiaChiGiaoHang());
                System.out.println("Số lượng sản phẩm mua: " + chiTietDonHang.getSoLuongSanPhamMua());
                System.out.println("Tiền vận chuyển: " + chiTietDonHang.getTienVanChuyen());
                System.out.println("VAT: " + chiTietDonHang.getVat());
                System.out.println("Tổng tiền: " + chiTietDonHang.getTongTien());
            } else {
                System.out.println("Không tìm thấy đơn hàng với mã: 1740907669030");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}