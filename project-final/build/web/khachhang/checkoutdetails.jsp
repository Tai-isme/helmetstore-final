<%@page import="model.DonHang"%>
<%@page import="database.ChiTietDonHangDAO"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="java.util.List"%>
<%@page import="database.SanPhamDAO"%>
<%@page import="model.SanPham"%>
<%@page import="database.DonHangDAO"%>
<%@page import="database.KhachHangDAO"%>
<%@page import="model.KhachHang"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String madonhang = (String) request.getAttribute("madonhang");
    ChiTietDonHangDAO ctdhdao = new ChiTietDonHangDAO();
    ChiTietDonHang ctdh = ctdhdao.select(madonhang);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Đơn Hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Chi Tiết Đơn Hàng</h2>
    <div class="card">
        
    </div>
</div>
</body>
</html>
