package database;

import model.KhachHang_MaGiamGia;
import java.sql.*;
import java.util.ArrayList;
import utils.JDBCUtil;

public class KhachHang_MaGiamGiaDAO implements DAOInterface<KhachHang_MaGiamGia> {

    @Override
    public ArrayList<KhachHang_MaGiamGia> selectAll() {
        ArrayList<KhachHang_MaGiamGia> list = new ArrayList<>();
        String sql = "SELECT * FROM khachhang_magiamgia";
        try (
                Connection conn = JDBCUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new KhachHang_MaGiamGia(rs.getString("maKhachHang"), rs.getString("idMaGiamGia")));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public KhachHang_MaGiamGia selectById(KhachHang_MaGiamGia t) {
        KhachHang_MaGiamGia khmg = null;
        String sql = "SELECT * FROM khachhang_magiamgia WHERE maKhachHang = ? AND idMaGiamGia = ?";
        try (Connection conn = JDBCUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getMaKhachHang());
            ps.setString(2, t.getIdMaGiamGia());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                khmg = new KhachHang_MaGiamGia(rs.getString("maKhachHang"), rs.getString("idMaGiamGia"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return khmg;
    }

    @Override
    public int insert(KhachHang_MaGiamGia t) {
        String sql = "INSERT INTO khachhang_magiamgia (makhachHang, idmagiamgia) VALUES (?, ?)";
        int ketQua = 0;
        try (
                Connection conn = JDBCUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getMaKhachHang());
            ps.setString(2, t.getIdMaGiamGia());
            ketQua = ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Lỗi ở insert khi khách hàng nhận mã giảm giá");
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public int insertAll(ArrayList<KhachHang_MaGiamGia> list) {
        int count = 0;
        for (KhachHang_MaGiamGia t : list) {
            count += insert(t);
        }
        return count;
    }

    @Override
    public int delete(KhachHang_MaGiamGia t) {
        int ketQua = 0;
        String sql = "DELETE FROM khachhang_magiamgia WHERE maKhachHang = ? AND idMaGiamGia = ?";
        try (Connection conn = JDBCUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getMaKhachHang());
            ps.setString(2, t.getIdMaGiamGia());
            ketQua = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public int deleteAll(ArrayList<KhachHang_MaGiamGia> list) {
        int count = 0;
        for (KhachHang_MaGiamGia t : list) {
            count += delete(t);
        }
        return count;
    }

    @Override
    public int update(KhachHang_MaGiamGia t) {
        // Không có nhiều thông tin để cập nhật, bạn có thể chỉnh sửa thêm nếu cần
        return 0;
    }
}