/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class ChiTietDonHang {

    private String maDonHang;
    private String maSanPham;
    private String trangThaiDonHang;
    private String phuongThucThanhToan;
    private String ngayDatHang;
    private String ngayGiaoHangDuKien;
    private String diaChiGiaoHang;
    private int soLuongSanPhamMua;
    private double tienVanChuyen;
    private int vat;
    public String magiamgia;
    private double tongTien;   

    public ChiTietDonHang(String maDonHang, String maSanPham, String trangThaiDonHang, String phuongThucThanhToan, String ngayDatHang, String ngayGiaoHangDuKien, String diaChiGiaoHang, int soLuongSanPhamMua, double tienVanChuyen, int vat, String magiamgia, double tongTien) {
        this.maDonHang = maDonHang;
        this.maSanPham = maSanPham;
        this.trangThaiDonHang = trangThaiDonHang;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.ngayDatHang = ngayDatHang;
        this.ngayGiaoHangDuKien = ngayGiaoHangDuKien;
        this.diaChiGiaoHang = diaChiGiaoHang;
        this.soLuongSanPhamMua = soLuongSanPhamMua;
        this.tienVanChuyen = tienVanChuyen;
        this.vat = vat;
        this.magiamgia = magiamgia;
        this.tongTien = tongTien;
    }

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTrangThaiDonHang() {
        return trangThaiDonHang;
    }

    public void setTrangThaiDonHang(String trangThaiDonHang) {
        this.trangThaiDonHang = trangThaiDonHang;
    }

    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }



    public String getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(String ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public String getNgayGiaoHangDuKien() {
        return ngayGiaoHangDuKien;
    }

    public void setNgayGiaoHangDuKien(String ngayGiaoHangDuKien) {
        this.ngayGiaoHangDuKien = ngayGiaoHangDuKien;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public int getSoLuongSanPhamMua() {
        return soLuongSanPhamMua;
    }

    public void setSoLuongSanPhamMua(int soLuongSanPhamMua) {
        this.soLuongSanPhamMua = soLuongSanPhamMua;
    }

    public double getTienVanChuyen() {
        return tienVanChuyen;
    }

    public void setTienVanChuyen(double tienVanChuyen) {
        this.tienVanChuyen = tienVanChuyen;
    }

    public int getVat() {
        return vat;
    }

    public void setVat(int vat) {
        this.vat = vat;
    }

    public String getMagiamgia() {
        return magiamgia;
    }

    public void setMagiamgia(String magiamgia) {
        this.magiamgia = magiamgia;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    

    

    
}