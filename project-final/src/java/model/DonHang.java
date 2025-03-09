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
public class DonHang {

    private String madonhang;
    private String makhachhang;
    private String masanpham;

    public DonHang() {
    }

    public DonHang(String madonhang, String makhachhang, String masanpham) {
        this.madonhang = madonhang;
        this.makhachhang = makhachhang;
        this.masanpham = masanpham;
    }
    
    public DonHang(String madonhang, String makhachhang) {
        this.madonhang = madonhang;
        this.makhachhang = makhachhang;
     
    }

    public String getMadonhang() {
        return madonhang;
    }

    public void setMadonhang(String madonhang) {
        this.madonhang = madonhang;
    }

    public String getMakhachhang() {
        return makhachhang;
    }

    public void setMakhachhang(String makhachhang) {
        this.makhachhang = makhachhang;
    }

    public String getMasanpham() {
        return masanpham;
    }

    public void setMasanpham(String masanpham) {
        this.masanpham = masanpham;
    }

}