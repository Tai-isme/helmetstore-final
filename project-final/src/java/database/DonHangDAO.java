package database;

import model.DonHang;
import java.sql.*;
import java.util.ArrayList;
import utils.JDBCUtil;

public class DonHangDAO implements DAOInterface<DonHang> {

    @Override
    public ArrayList<DonHang> selectAll() {
        ArrayList<DonHang> list = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT * FROM donhang";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String madonhang = rs.getString("madonhang");
                String makhachhang = rs.getString("makhachhang");
                String masanpham = rs.getString("masanpham");
                list.add(new DonHang(madonhang, makhachhang, masanpham));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public DonHang selectById(DonHang t) {
        DonHang dh = null;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT * FROM donhang WHERE madonhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getMadonhang());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String madonhang = rs.getString("madonhang");
                String makhachhang = rs.getString("makhachhang");
                String masanpham = rs.getString("masanpham");
                dh = new DonHang(madonhang, makhachhang, masanpham);
            }
           con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dh;
    }

    @Override
    public int insert(DonHang dh) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO donhang (madonhang, makhachhang, masanpham) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dh.getMadonhang());
            ps.setString(2, dh.getMakhachhang());
            ps.setString(3, dh.getMasanpham());
            result = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<DonHang> list) {
        int count = 0;
        for (DonHang dh : list) {
            count += insert(dh);
        }
        return count;
    }

    @Override
    public int delete(DonHang dh) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "DELETE FROM donhang WHERE madonhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dh.getMadonhang());
            result = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int deleteAll(ArrayList<DonHang> list) {
        int count = 0;
        for (DonHang dh : list) {
            count += delete(dh);
        }
        return count;
    }

    @Override
    public int update(DonHang dh) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "UPDATE donhang SET makhachhang = ?, masanpham = ? WHERE madonhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dh.getMakhachhang());
            ps.setString(2, dh.getMasanpham());
            ps.setString(3, dh.getMadonhang());
            result = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}