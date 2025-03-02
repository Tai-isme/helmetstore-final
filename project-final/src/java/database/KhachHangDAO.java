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

                ketQua = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh, soDienThoai, email, quocTich, diaChiKhachHang, diaChiNhanHang, dangKyNhanBangTin, maXacThuc, thoiGianHieuLucMaXacThuc, trangThaiXacThuc, hinhAvatar);

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

            // B2: Tạo câu SQL
            String sql = "INSERT INTO khachhang(makhachhang, tendangnhap, matkhau,email) VALUES(?,?,?,?) ";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, t.getMaKhachHang());
            ps.setString(2, t.getTenDangNhap());
            ps.setString(3, t.getMatKhau());
            ps.setString(4, t.getEmail());

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
            String sql = "UPDATE khachhang SET hovaten=?, gioitinh=?, ngaysinh=?, sodienthoai=?, email=?, quoctich=?, diachikhachhang=?, diachinhanhang=?, dangkynhanbangtin=? "
                    + " WHERE makhachhang=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, t.getHoVaTen());
            ps.setString(2, t.getGioiTinh());
            ps.setDate(3, t.getNgaySinh());
            ps.setString(4, t.getSoDienThoai());
            ps.setString(5, t.getEmail());
            ps.setString(6, t.getQuocTich());
            ps.setString(7, t.getDiaChiKhachHang());
            ps.setString(8, t.getDiaChiNhanHang());
            ps.setBoolean(9, t.isDangKyNhanBangTin());

            ps.setString(10, t.getMaKhachHang());

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

                ketQua = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh, soDienThoai, email, quocTich, diaChiKhachHang, diaChiNhanHang, dangKyNhanBangTin, maXacThuc, thoiGianHieuLucMaXacThuc, trangThaiXacThuc, hinhAvatar);

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

    public static void main(String[] args) {
        // Tạo đối tượng KhachHang mẫu để test
        KhachHang kh = new KhachHang();
        kh.setMaKhachHang("1740161865375");  // Đảm bảo mã này tồn tại trong DB
        kh.setHoVaTen("Nguyễn Văn A");
        kh.setGioiTinh("male");
        kh.setNgaySinh(Date.valueOf("2000-01-01"));
        kh.setSoDienThoai("0909123456");
        kh.setEmail("nguyenvana@example.com");
        kh.setQuocTich("Vietnam");
        kh.setDiaChiKhachHang("123 Lê Lợi, Q1");
        kh.setDiaChiNhanHang("123 Lê Lợi, Q1");
        kh.setDangKyNhanBangTin(true);

        // Tạo đối tượng DAO và gọi hàm update
        KhachHangDAO dao = new KhachHangDAO();
        int ketQua = dao.update(kh);

        if (ketQua > 0) {
            System.out.println("Cập nhật thành công!");
        } else {
            System.out.println("Cập nhật thất bại!");
        }
    }
}