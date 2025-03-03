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
        String sql = " SELECT * FROM sanpham ";

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

    public List<SanPham_Size> selectAllSanPham_Size() {
        List<SanPham_Size> listSanPham_Size = new ArrayList<>();
        String sql = " SELECT * FROM sanpham_size ";

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
                SanPham_Size sp_size = new SanPham_Size(
                        rs.getString("masanpham"), rs.getString("size"), rs.getInt("soluong")
                );
                listSanPham_Size.add(sp_size);
            }
            JDBCUtil.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listSanPham_Size;
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

    public static void main(String[] args) {
        AdminDAO ado = new AdminDAO();
        String masanpahm =  "123123";
        String size =  "L";
        int soluong =  9999999;
        SanPham sp = new SanPham(masanpahm, size, soluong);
//        sp.setTensanpham("test");
        //masanpham, tensanpham, hinhanhsanpham, mausac, kieumau, gianhap, giaban, giamgia, mota
//        sp.setHinhanhsanpham("1.png");
//        sp.setMausac("test");
//        sp.setKieumau("test");
//        sp.setGianhap(10.0);
//        sp.setGiaban(9999.0);
//        sp.setGiamgia(5);
//        sp.setMota("test test test");
        int result = ado.insertSize(sp);
        System.out.println(result);
    }

}
