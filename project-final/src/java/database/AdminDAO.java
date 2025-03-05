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
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import model.SanPham;
import model.SanPham_Size;
import utils.JDBCUtil;

/**
 *
 * @author Admin
 */
public class AdminDAO {

    public List<SanPham> selectAllSanPham() {
        List<SanPham> listSanPham = new ArrayList<>();
        String sql = " SELECT * FROM \n"
                + "sanpham s JOIN sanpham_size ss ON s.masanpham = ss.masanpham";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Bước 1: Lấy Connection
            conn = JDBCUtil.getConnection();

            // Bước 2: Tạo PreparedStatement
            stmt = conn.prepareStatement(sql);

            // Bước 3: Thực thi truy vấn
            rs = stmt.executeQuery();

            // Bước 4: Xử lý dữ liệu
            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getString("masanpham"),
                        rs.getString("tensanpham"),
                        rs.getString("hinhanhsanpham"),
                        rs.getString("mausac"),
                        rs.getString("size"),
                        rs.getInt("soluong"),
                        rs.getString("kieumau"),
                        rs.getDouble("gianhap"),
                        rs.getDouble("giaban"),
                        rs.getInt("giamgia"),
                        rs.getString("mota")
                );
                listSanPham.add(sp);
            }
            JDBCUtil.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listSanPham;
    }

    public int insertSanPham(SanPham sp) {
        int ketQua = 0;
        try {
            // B1: Tạo connection
            Connection c = JDBCUtil.getConnection();

            // B2: Tạo câu SQL
            String sql = " INSERT INTO sanpham(masanpham, tensanpham, hinhanhsanpham, mausac, kieumau, gianhap, giaban, giamgia, mota)\n"
                    + "VALUES (?,?,?,?,?,?,?,?,?) ";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, sp.getMasanpham());
            ps.setString(2, sp.getTensanpham());
            ps.setString(3, sp.getHinhanhsanpham());
            ps.setString(4, sp.getMausac());
            ps.setString(5, sp.getKieumau());
            ps.setDouble(6, sp.getGianhap());
            ps.setDouble(7, sp.getGiaban());
            ps.setInt(8, sp.getGiamgia());
            ps.setString(9, sp.getMota());

            // B3: Chạy câu lệnh SQL
            ketQua = ps.executeUpdate();

            //B4: Xử lý dữ liệu (nếu cần)
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // B5: Đóng Connection
            JDBCUtil.close(c);

        } catch (SQLException e) {
            System.out.println("Insert thất bại");
            e.printStackTrace();
            e.getErrorCode();
            e.getSQLState();
        }

        return ketQua;
    }

    public int insertSize(SanPham sp) {
        int ketQua = 0;
        try {
            // B1: Tạo connection
            Connection c = JDBCUtil.getConnection();

            // B2: Tạo câu SQL
            String sql = " INSERT INTO sanpham_size(masanpham, size, soluong) VALUES (?,?,?) ";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, sp.getMasanpham());
            ps.setString(2, sp.getKichco());
            ps.setInt(3, sp.getSoluong());

            // B3: Chạy câu lệnh SQL
            ketQua = ps.executeUpdate();

            //B4: Xử lý dữ liệu (nếu cần)
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // B5: Đóng Connection
            JDBCUtil.close(c);

        } catch (SQLException e) {
            System.out.println("Insert thất bại");
            e.printStackTrace();
            e.getErrorCode();
            e.getSQLState();
        }

        return ketQua;
    }

    public boolean delete(SanPham sp) {
        String sql = " DELETE FROM sanpham WHERE masanpham = ? ";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sp.getMasanpham());

            stmt.executeUpdate();
            JDBCUtil.close(conn);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }

    public boolean deleteSanPhamSize(SanPham sp) {
        String sql = " DELETE FROM sanpham_size WHERE masanpham = ? and size = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sp.getMasanpham());
            stmt.setString(2, sp.getKichco());

            stmt.executeUpdate();
            JDBCUtil.close(conn);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }

    public boolean updateSanPham(SanPham sp) {
        String sql = " UPDATE sanpham\n"
                + "SET tensanpham = ?,\n"
                + "    hinhanhsanpham = ?,\n"
                + "    mausac = ?,\n"
                + "    kieumau = ?,\n"
                + "    gianhap = ?,\n"
                + "    giaban = ?,\n"
                + "    giamgia = ?,\n"
                + "    mota = ?\n"
                + "WHERE masanpham = ?;";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, sp.getTensanpham());
            stmt.setString(2, sp.getHinhanhsanpham());
            stmt.setString(3, sp.getMausac());
            stmt.setString(4, sp.getKieumau());
            stmt.setDouble(5, sp.getGianhap());
            stmt.setDouble(6, sp.getGiaban());
            stmt.setInt(7, sp.getGiamgia());
            stmt.setString(8, sp.getMota());
            stmt.setString(9, sp.getMasanpham());

            stmt.executeUpdate();
            JDBCUtil.close(conn);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }

    public boolean updateSanPhamSize(SanPham sp) {
        String sql = " UPDATE sanpham_size\n"
                + "SET size = ?, \n"
                + "    soluong = '?\n"
                + "WHERE masanpham = ?;";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, sp.getKichco());
            stmt.setString(2, sp.getKichco());
            stmt.setString(3, sp.getMasanpham());

            stmt.executeUpdate();
            JDBCUtil.close(conn);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }

    public static void main(String[] args) {
        AdminDAO ado = new AdminDAO();
        List<SanPham> list = ado.selectAllSanPham();
        for (SanPham sanPham : list) {
            System.out.println(sanPham.getKichco());
        }
    }

}
