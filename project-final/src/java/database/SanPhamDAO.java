package database;

import model.SanPham;
import utils.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SanPhamDAO implements DAOInterface<SanPham> {

    @Override
    public ArrayList<SanPham> selectAll() {
        ArrayList<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM sanpham";

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
                list.add(sp);
            }
            JDBCUtil.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public SanPham selectById(SanPham sp) {
        SanPham sanPham = null;
        String sql = "SELECT * FROM sanpham WHERE masanpham=?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sp.getMasanpham());

            rs = stmt.executeQuery();

            if (rs.next()) {
                sanPham = new SanPham(
                        rs.getString("masanpham"),
                        rs.getString("tensanpham"),
                        rs.getString("hinhanhsanpham"),
                        rs.getString("mausac"),
                        rs.getString("kichco"),
                        rs.getInt("soluong"),
                        rs.getString("kieumau"),
                        rs.getDouble("gianhap"),
                        rs.getDouble("giaban"),
                        rs.getInt("giamgia"),
                        rs.getString("mota")
                );
            }

            JDBCUtil.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sanPham;
    }

    @Override
    public int insert(SanPham sp) {
        int ketQua = 0;
        String sql = "INSERT INTO sanpham VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, sp.getMasanpham());
            stmt.setString(2, sp.getTensanpham());
            stmt.setString(3, sp.getHinhanhsanpham());
            stmt.setString(4, sp.getMausac());
            stmt.setString(5, sp.getKichco());
            stmt.setInt(6, sp.getSoluong());
            stmt.setString(7, sp.getKieumau());
            stmt.setDouble(8, sp.getGianhap());
            stmt.setDouble(9, sp.getGiaban());
            stmt.setInt(10, sp.getGiamgia());
            stmt.setString(11, sp.getMota());

            ketQua = stmt.executeUpdate();
            JDBCUtil.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return ketQua;
    }

    @Override
    public int delete(SanPham sp) {
        int ketQua = 0;
        String sql = "DELETE FROM sanpham WHERE masanpham=?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sp.getMasanpham());

            ketQua = stmt.executeUpdate();
            JDBCUtil.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
        return ketQua;
    }

    @Override
    public int update(SanPham sp) {
        int ketQua = 0;
        String sql = "UPDATE sanpham SET tensanpham=?, hinhanhsanpham=?, mausac=?, kichco=?, soluong=?, kieumau=?, gianhap=?, giaban=?, giamgia=?, mota=? WHERE masanpham=?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, sp.getTensanpham());
            stmt.setString(2, sp.getHinhanhsanpham());
            stmt.setString(3, sp.getMausac());
            stmt.setString(4, sp.getKichco());
            stmt.setInt(5, sp.getSoluong());
            stmt.setString(6, sp.getKieumau());
            stmt.setDouble(7, sp.getGianhap());
            stmt.setDouble(8, sp.getGiaban());
            stmt.setInt(9, sp.getGiamgia());
            stmt.setString(10, sp.getMota());
            stmt.setString(11, sp.getMasanpham());

            ketQua = stmt.executeUpdate();

            JDBCUtil.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    @Override
    public int insertAll(ArrayList<SanPham> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteAll(ArrayList<SanPham> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<String> selectColor() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "select distinct mausac\n"
                + "from sanpham";

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

                list.add(rs.getString("mausac"));
            }
            JDBCUtil.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<SanPham> searchByConditions(String types, String color, String size, int priceFrom, int priceTo) {

        ArrayList<SanPham> list = new ArrayList<SanPham>();

        try {
            String sql = "SELECT * FROM sanpham WHERE 1=1";

// Lọc theo loại mũ (Fullface, Half-Helmet, Three-Quarter)
            if (types.length() > 0) {
                sql += " AND kieumau = ?";
            }

            if (color.length() > 0) {
                sql += " AND mausac = ?";
            }

// Lọc theo size (S, M, L, XL)
            if (size.length() > 0) {
                sql += " AND kichco = ?";
            }

// Lọc theo khoảng giá (200000-500000, 500000-1000000, ...)
            if (priceFrom > 0 && priceTo > 0) {

                sql += " AND giaban BETWEEN ? AND ?";
            }

            Connection conn = JDBCUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            int index = 1;

// Gán giá trị cho câu SQL
            if (types.length() > 0) {
                ps.setString(index++, types);
            }

            if (color.length() > 0) {
                ps.setString(index++, color);
            }

            if (size.length() > 0) {
                ps.setString(index++, size);
            }

            if (priceFrom > 0 && priceTo > 0) {

                ps.setInt(index++, priceFrom);
                ps.setInt(index++, priceTo);
            }

// Thực thi truy vấn
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("masanpham");
                String tensanpham = rs.getString("tensanpham");
                String hinhanhsanpham = rs.getString("hinhanhsanpham");
                String mausac = rs.getString("mausac");
                String kichco = rs.getString("kichco");
                Integer soluong = rs.getInt("soluong");
                String kieumau = rs.getString("kieumau");
                Double gianhap = rs.getDouble("gianhap");
                Double giaban = rs.getDouble("giaban");
                Integer giamgia = rs.getInt("giamgia");
                String mota = rs.getString("mota");

                SanPham sp = new SanPham(masanpham, tensanpham, hinhanhsanpham, mausac, kichco, soluong, kieumau, gianhap, giaban, giamgia, mota);
                list.add(sp);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
        return list;

    }

    public List<SanPham> searchList(String keyword) {
        List<SanPham> list = new ArrayList<SanPham>();
        SanPham sp = null;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT * FROM sanpham WHERE tensanpham LIKE ? OR masanpham LIKE ? OR mausac LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, '%' + keyword + '%');
            ps.setString(2, '%' + keyword + '%');
            ps.setString(3, '%' + keyword + '%');
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    sp = new SanPham(rs.getString("masanpham"), rs.getString("tensanpham"), rs.getString("hinhanhsanpham"), rs.getString("mausac"),
                            rs.getString("kieumau"), rs.getDouble("gianhap"),
                            rs.getDouble("giaban"), rs.getInt("giamgia"), rs.getString("mota"));
                    list.add(sp);
                }
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SanPham> sort(List<SanPham> list, String sortPrices) {
        if (sortPrices.equals("default")) {
            return list;
        }

        if (sortPrices.equals("price-asc")) {
            Collections.sort(list, new Comparator<SanPham>() {
                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return o1.getGiaban().compareTo(o2.getGiaban());
                }
            });
        } else if (sortPrices.equals("price-desc")) {
            Collections.sort(list, new Comparator<SanPham>() {
                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return o2.getGiaban().compareTo(o1.getGiaban());
                }
            });
        }

        return list;
    }

    public SanPham selectById(String masanpham) {
        SanPham sanPham = null;
        String sql = "SELECT * FROM sanpham WHERE masanpham=?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, masanpham);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String masanphamStr = rs.getString(1);
                String tensanpham = rs.getString(2);
                String hinhanhsanpham = rs.getString(3);
                String mausac = rs.getString(4);

                String kieumau = rs.getString(5);
                Double gianhap = rs.getDouble(6);
                Double giaban = rs.getDouble(7);
                Integer giamgia = rs.getInt(8);
                String mota = rs.getString(9);

                sanPham = new SanPham(masanpham, tensanpham, hinhanhsanpham, mausac, kieumau, gianhap, giaban, giamgia, mota);
            }

            JDBCUtil.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sanPham;
    }

}
