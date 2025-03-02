/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.DonHang;
import utils.JDBCUtil;

/**
 *
 * @author Admin
 */
public class DonHangDAO {

    public int insert(DonHang dh) throws SQLException {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO donhang VALUES (?, ?, ?)";
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
}
