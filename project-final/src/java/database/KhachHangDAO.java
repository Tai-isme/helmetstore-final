package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.KhachHang;
import utils.JDBCUtil;

public class KhachHangDAO implements DAOInterface<KhachHang> {

    @Override
    public ArrayList<KhachHang> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public KhachHang selectById(KhachHang kh) {
        KhachHang ketQua = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " SELECT * \n"
                    + " FROM khachhang\n"
                    + " WHERE makhachhang = ? ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getMaKhachHang());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String maKhachHang = rs.getString(1);
                String tenDangNhap = rs.getString(2);
                String matKhau = rs.getString(3);
                String hoVaTen = rs.getString(4);
                String gioiTinh = rs.getString(5);
                Date ngaySinh = rs.getDate(6);
                String soDienThoai = rs.getString(7);
                String email = rs.getString(8);
                String quocTich = rs.getString(9);
                String diaChiKhachHang = rs.getString(10);
                String diaChiNhanHang = rs.getString(11);
                boolean dangKyNhanBangTin = rs.getBoolean(12);
                String maXacThuc = rs.getString(13);
                String thoiGianHieuLucMaXacThuc = rs.getString(14);
                String trangThaiXacThuc = rs.getString(15);
                String hinhAvatar = rs.getString(16);
                int isAdmin = rs.getInt(17);

                ketQua = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh,
                        soDienThoai, email, quocTich, diaChiKhachHang, diaChiNhanHang, dangKyNhanBangTin,
                        maXacThuc, thoiGianHieuLucMaXacThuc, trangThaiXacThuc, hinhAvatar, isAdmin);

            }

            JDBCUtil.close(con);

        } catch (Exception e) {
        }

        return ketQua;
    }

    public KhachHang selectById(String id) {
        KhachHang ketQua = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " SELECT * \n"
                    + " FROM khachhang\n"
                    + " WHERE makhachhang = ? ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String maKhachHang = rs.getString(1);
                String tenDangNhap = rs.getString(2);
                String matKhau = rs.getString(3);
                String hoVaTen = rs.getString(4);
                String gioiTinh = rs.getString(5);
                Date ngaySinh = rs.getDate(6);
                String soDienThoai = rs.getString(7);
                String email = rs.getString(8);
                String quocTich = rs.getString(9);
                String diaChiKhachHang = rs.getString(10);
                String diaChiNhanHang = rs.getString(11);
                boolean dangKyNhanBangTin = rs.getBoolean(12);
                String maXacThuc = rs.getString(13);
                String thoiGianHieuLucMaXacThuc = rs.getString(14);
                String trangThaiXacThuc = rs.getString(15);
                String hinhAvatar = rs.getString(16);
                int isAdmin = rs.getInt(17);

                ketQua = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh,
                        soDienThoai, email, quocTich, diaChiKhachHang, diaChiNhanHang, dangKyNhanBangTin,
                        maXacThuc, thoiGianHieuLucMaXacThuc, trangThaiXacThuc, hinhAvatar, isAdmin);

            }

            JDBCUtil.close(con);

        } catch (Exception e) {
        }

        return ketQua;
    }

    @Override
    public int insert(KhachHang t) {
        int ketQua = 0;
        System.out.println("Dòng 25 insert");
        try {
            // B1: Tạo connection
            Connection c = JDBCUtil.getConnection();

            // B2: Tạo câu SQL với đầy đủ các trường
            String sql = "INSERT INTO khachhang(makhachhang, tendangnhap, matkhau, hovaten, gioitinh, ngaysinh, sodienthoai, email, quoctich, diachikhachhang, diachinhanhang, isAdmin) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, t.getMaKhachHang());
            ps.setString(2, t.getTenDangNhap());
            ps.setString(3, t.getMatKhau());
            ps.setString(4, t.getHoVaTen());
            ps.setString(5, t.getGioiTinh());
            if (t.getNgaySinh() == null) {
                ps.setNull(6, java.sql.Types.DATE);
            } else {
                ps.setDate(6, t.getNgaySinh());
            }
            ps.setString(7, t.getSoDienThoai());
            ps.setString(8, t.getEmail());
            ps.setString(9, t.getQuocTich());
            ps.setString(10, t.getDiaChiKhachHang());
            ps.setString(11, t.getDiaChiNhanHang());
            ps.setInt(12, t.getIsAdmin()); // Nếu isAdmin là boolean, cần chuyển đổi sang int

            // B3: Chạy câu lệnh SQL
            ketQua = ps.executeUpdate();

            // B4: Xử lý dữ liệu (nếu cần)
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // B5: Đóng Connection
            JDBCUtil.close(c);

        } catch (SQLException e) {
            System.out.println("Insert thất bại");
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int insertAll(ArrayList<KhachHang> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(KhachHang t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteAll(ArrayList<KhachHang> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(KhachHang t) {
        int ketQua = 0;
        try {
            // B1: Tạo connection
            Connection c = JDBCUtil.getConnection();

            // B2: Tạo câu SQL
            String sql = "UPDATE khachhang SET tendangnhap=?, matkhau=?, hovaten=?, gioitinh=?, ngaysinh=?, sodienthoai=?, email=?, quoctich=?, diachikhachhang=?, diachinhanhang=?, hinhavatar=?, isAdmin=? "
                    + " WHERE makhachhang=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, t.getTenDangNhap());
            ps.setString(2, t.getMatKhau());
            ps.setString(3, t.getHoVaTen());
            ps.setString(4, t.getGioiTinh());
            ps.setDate(5, t.getNgaySinh());
            ps.setString(6, t.getSoDienThoai());
            ps.setString(7, t.getEmail());
            ps.setString(8, t.getQuocTich());
            ps.setString(9, t.getDiaChiKhachHang());
            ps.setString(10, t.getDiaChiNhanHang());
            ps.setString(11, t.getHinhAvatar());
            ps.setInt(12, t.getIsAdmin());

            ps.setString(13, t.getMaKhachHang());

            System.out.println(ps);
            // B3: Chạy câu lệnh SQL
            ketQua = ps.executeUpdate();

            //B4: Xử lý dữ liệu (nếu cần)
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // B5: Đóng Connection
            JDBCUtil.close(c);

        } catch (SQLException e) {
            System.out.println("Update thất bại");
            e.printStackTrace();
            e.getErrorCode();
            e.getSQLState();
        }

        return ketQua;
    }

    public KhachHang selectByUsernameAndPassword(KhachHang kh) {
        KhachHang ketQua = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " SELECT * \n"
                    + " FROM khachhang\n"
                    + " WHERE (tendangnhap = ? OR email = ?) AND matkhau = ? ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getTenDangNhap());
            ps.setString(2, kh.getTenDangNhap());
            ps.setString(3, kh.getMatKhau());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String maKhachHang = rs.getString(1);
                String tenDangNhap = rs.getString(2);
                String matKhau = rs.getString(3);
                String hoVaTen = rs.getString(4);
                String gioiTinh = rs.getString(5);
                Date ngaySinh = rs.getDate(6);
                String soDienThoai = rs.getString(7);
                String email = rs.getString(8);
                String quocTich = rs.getString(9);
                String diaChiKhachHang = rs.getString(10);
                String diaChiNhanHang = rs.getString(11);
                boolean dangKyNhanBangTin = rs.getBoolean(12);
                String maXacThuc = rs.getString(13);
                String thoiGianHieuLucMaXacThuc = rs.getString(14);
                String trangThaiXacThuc = rs.getString(15);
                String hinhAvatar = rs.getString(16);
                int isAdmin = rs.getInt(17);

                ketQua = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh,
                        soDienThoai, email, quocTich, diaChiKhachHang, diaChiNhanHang, dangKyNhanBangTin,
                        maXacThuc, thoiGianHieuLucMaXacThuc, trangThaiXacThuc, hinhAvatar, isAdmin);

            }

            JDBCUtil.close(con);

        } catch (Exception e) {
        }

        return ketQua;
    }

    public int changePassword(KhachHang khachHang) {
        int ketQua = 0;

        return ketQua;
    }

    public int updateMaXacThuc(KhachHang khachHang) {
        int ketQua = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " UPDATE khachhang \n"
                    + " SET maxacthuc = ?, thoigianhieulucmaxacthuc = ?, trangthaixacthuc = ?"
                    + " WHERE makhachhang = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, khachHang.getMaXacThuc());
            ps.setString(2, khachHang.getThoiGianHieuLucMaXacThuc());
            ps.setString(3, khachHang.isTrangThaiXacThuc());
            ps.setString(4, khachHang.getMaKhachHang());

            ketQua = ps.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            JDBCUtil.close(con);

        } catch (Exception e) {
            System.out.println("Lỗi ở update OTP via email");
            e.printStackTrace();
        }

        return ketQua;
    }

    public int updateNewPassword(KhachHang khachHang) {
        int ketQua = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " UPDATE khachhang\n "
                    + " SET matkhau = ?, trangthaixacthuc = ? "
                    + " WHERE makhachhang = ? ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, khachHang.getMatKhau());
            ps.setString(2, "1");
            ps.setString(3, khachHang.getMaKhachHang());

            ketQua = ps.executeUpdate();

            JDBCUtil.close(con);

        } catch (Exception e) {
            System.out.println("Lỗi ở updateNewPassword");
            e.printStackTrace();
        }

        return ketQua;

    }

    public int updateAvatar(KhachHang khachHang) {
        int ketQua = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " UPDATE khachhang\n"
                    + " SET hinhavatar = ?\n"
                    + " WHERE makhachhang = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, khachHang.getHinhAvatar());
            ps.setString(2, khachHang.getMaKhachHang());

            ketQua = ps.executeUpdate();

            JDBCUtil.close(con);

        } catch (Exception e) {
            System.out.println("Lỗi ở updateAvatar");
            e.printStackTrace();
        }

        return ketQua;
    }

    public boolean checkIsAdmin(KhachHang khachHang) {
        boolean result = false;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = " SELECT * FROM khachhang WHERE tendangnhap = ? AND matkhau = ? AND isAdmin = 1 ";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, khachHang.getTenDangNhap());
            ps.setString(2, khachHang.getMatKhau());

            ResultSet rs = ps.executeQuery();
            result = rs.next();
            con.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng KhachHang mới với dữ liệu mẫu
        KhachHang khachHang = new KhachHang();
        khachHang.setMaKhachHang("3");
        khachHang.setTenDangNhap("nguyenvana");
        khachHang.setMatKhau("123456");
        khachHang.setHoVaTen("Nguyen Van A");
        khachHang.setGioiTinh("Male");
        khachHang.setNgaySinh(Date.valueOf("2000-05-15")); // YYYY-MM-DD
        khachHang.setSoDienThoai("123456789");
        khachHang.setEmail("nguyenvana@gmail.com");
        khachHang.setQuocTich("Vietnam");
        khachHang.setDiaChiKhachHang("123 Đường ABC, Quận 1, TP.HCM");
        khachHang.setDiaChiNhanHang("456 Đường XYZ, Quận 3, TP.HCM");
        khachHang.setIsAdmin(0); // 0 = không phải admin, 1 = admin

        // Gọi phương thức insert
        KhachHangDAO khachHangDAO = new KhachHangDAO();
        int ketQua = khachHangDAO.insert(khachHang);

        // Kiểm tra kết quả
        if (ketQua > 0) {
            System.out.println("Thêm khách hàng thành công!");
        } else {
            System.out.println("Thêm khách hàng thất bại!");
        }
    }

    public boolean isUsernameExists(String tenDangNhap) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM KhachHang WHERE tenDangNhap = ?";
        try (Connection conn = JDBCUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenDangNhap);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

}
