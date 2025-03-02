<%@page import="model.DonHang"%>
<%@page import="database.ChiTietDonHangDAO"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="model.MaGiamGia"%>
<%@page import="database.MaGiamGiaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.SanPham"%>
<%@page import="database.SanPhamDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.GioHangDAO"%>
<%@page import="model.GioHang"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();;
%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>
            THT Helmet Store

        </title>

        <link rel="shortcut icon" href="<%= url1%>/GUI/images/favicon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


        <!-- slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="<%= url1%>/GUI/css/bootstrap.css" />

        <!-- Custom styles for this template -->
        <link href="<%= url1%>/GUI/css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="<%= url1%>/GUI/css/responsive.css" rel="stylesheet" />

        <!-- Voucher style -->
        <link rel="stylesheet" href="<%=url1%>/GUI/css/voucher.css">


    </head>
    <div class=" container-fluid my-5 ">
        <%@include file="../GUI/header.jsp" %>

        <%            GioHangDAO dao = new GioHangDAO();
            List<GioHang> list = new ArrayList<GioHang>();
            list = dao.selectGioHangCuaKhachHang(khachHang.getMaKhachHang());
        %>
        <form action="<%= url%>/don-hang" method="GET">
            <input type="hidden" name="hanhdong" value="saveDonHang">
            <input type="text" name="makhachhang" value="<%= khachHang.getMaKhachHang()%>">
            <div class="row justify-content-center ">
                <div class="col-xl-10">
                    <div class="card shadow-lg ">
                        <div class="row p-2 mt-3 justify-content-between mx-sm-2">
                            <div class="col d-flex justify-content-center" >
                                <div class="row justify-content-start ">
                                    <div class="col"> <img class="irc_mi img-fluid cursor-pointer " src="https://i.imgur.com/jFQo2lD.png" width="70" height="70"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mx-auto justify-content-center text-center">
                            <div class="col-12 mt-3 ">
                                <nav aria-label="breadcrumb" class="second ">
                                    <ol class="breadcrumb indigo lighten-6 first ">
                                        <li class="breadcrumb-item font-weight-bold ">
                                            <a class="black-text text-uppercase " href="<%= url%>/GUI/shop.jsp"><span class="mr-md-3 mr-1">BACK TO SHOP</span></a>
                                            <i class="fa fa-angle-double-right " aria-hidden="true"></i>
                                        </li>
                                        <li class="breadcrumb-item font-weight-bold">
                                            <a class="black-text text-uppercase" href="<%= url%>/khachhang/cart.jsp"><span class="mr-md-3 mr-1">CART</span></a>
                                            <i class="fa fa-angle-double-right text-uppercase " aria-hidden="true"></i>
                                        </li>
                                        <li class="breadcrumb-item font-weight-bold">
                                            <a class="black-text text-uppercase active-2" href="<%= url%>/khachhang/checkout.jsp"><span class="mr-md-3 mr-1">CHECKOUT</span></a>
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div class="row justify-content-around">
                            <div class="col-md-5">
                                <div class="card border-0">
                                    <div class="card-header pb-0">
                                        <h2 class="card-title space ">Checkout</h2>
                                        <p class="card-text text-muted mt-4 space">SHIPPING DETAILS</p>
                                        <hr class="my-0">

                                        <div class="form-group"> 
                                            <label for="fullname" class="small text-muted mb-1">Full name</label> 
                                            <input type="text" value="<%= khachHang.getHoVaTen()%>" class="form-control form-control-sm" name="fullname" id="fullname" aria-describedby="helpId" placeholder="Full name"> 
                                        </div>
                                        <div class="form-group"> 
                                            <label for="email" class="small text-muted mb-1">Email</label> 
                                            <input type="email" value="<%= khachHang.getEmail()%>" class="form-control form-control-sm" name="email" id="NAME" aria-describedby="helpId" placeholder="Email"> 
                                        </div>
                                        <div class="form-group"> 
                                            <label for="phone" class="small text-muted mb-1">Phone number</label> 
                                            <input type="tel" value="<%= khachHang.getSoDienThoai()%>" class="form-control form-control-sm" name="phone" id="NAME" aria-describedby="helpId" placeholder="Phone number"> 
                                        </div>
                                        <div class="form-group"> 
                                            <label for="quocgia" class="small text-muted mb-1">Country</label> 
                                            <input type="text" value="<%= khachHang.getQuocTich()%>" class="form-control form-control-sm" name="quocgia" id="NAME" aria-describedby="helpId" placeholder="Country"> 
                                        </div>
                                        <div class="form-group"> 
                                            <label for="delivery" class="small text-muted mb-1">Delivery address</label> 
                                            <input type="text" value="<%= khachHang.getDiaChiNhanHang()%>" class="form-control form-control-sm" name="delivery" id="NAME" aria-describedby="helpId" placeholder="Delivery address"> 
                                        </div>
                                    </div>

                                    <div class="card-body">
                                        <div class="row mt-4">
                                            <div class="col">
                                                <p class="text-muted mb-2">PAYMENT DETAILS</p>
                                                <hr class="mt-0">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <p class="text-muted mb-2 small">Payment Type:</p>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="paymentMethod" id="cash" value="cash" checked>
                                                    <label class="form-check-label text-muted" for="cash">Cash on Delivery (COD)</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="paymentMethod" id="bankTransfer" value="bankTransfer">
                                                    <label class="form-check-label text-muted" for="bankTransfer">Bank Transfer</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-md-5">
                                            <!--<div class="col"> <button type="button" name="" id="" class="btn btn-lg btn-block ">PURCHASE</button> </div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="card border-0 ">
                                    <div class="card-header card-2">
                                        <p class="card-text text-muted mt-md-4 mb-2 space">YOUR CART <span class="small text-muted ml-2 "><a href="<%= url%>/khachhang/cart.jsp"">EDIT CART</a></span> </p>
                                        <hr class="my-2">
                                    </div>

                                    <div class="card-body pt-0">
                                        <%
                                            int i = 0;
                                            if (list != null && !list.isEmpty()) {
                                                for (GioHang gioHang1 : list) {
                                                    i++;
                                                    SanPhamDAO sanPhamDao = new SanPhamDAO();
                                                    SanPham sp = sanPhamDao.selectById(gioHang1.getMasanpham());
                                                    System.out.println("sp = " + sp.toString());

                                        %>
                                        <div class="row justify-content-between">
                                            <div class="col-auto col-md-7">
                                                <div class="media flex-column flex-sm-row"> <img class=" img-fluid" src="<%= url%>/GUI/imgsanpham/<%= sp.getHinhanhsanpham()%>" width="62" height="62">
                                                    <div class="media-body my-auto">
                                                        <div class="row ">
                                                            <div class="col-auto">
                                                                <p class="mb-0"><b><%= sp.getTensanpham() + " (" + sp.getMasanpham() + ")"%></b></p><small class="text-muted"><%= "Size: " + gioHang1.getSize() + " Color: " + sp.getMausac()%></small>
                                                                <input type="hidden" value="<%=sp.getMasanpham()%>" name="sanpham<%=i%>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" pl-0 flex-sm-col col-auto my-auto">
                                                <p class="boxed-1"><%= gioHang1.getSoluong()%></p>
                                                <input type="hidden" value="" name="">
                                            </div>
                                            <div class=" pl-0 flex-sm-col col-auto my-auto ">
                                                <p><b>179 SEK</b></p>
                                            </div>
                                        </div>
                                        <hr class="my-2">
                                        <%}%>
                                        <%}%>
                                        <hr class="my-2">


                                        <%
                                            MaGiamGiaDAO maGiamGiaDAO = new MaGiamGiaDAO();
                                            List<MaGiamGia> listMaGiamGia = maGiamGiaDAO.selectAll();

                                            if (listMaGiamGia != null && !listMaGiamGia.isEmpty()) {
                                                for (MaGiamGia maGiamGia : listMaGiamGia) {
                                        %>      

                                        <div class="row mb-3">
                                            <div class="card-item" style="display: flex; align-items: center; gap: 10px; padding: 8px; border: 1px solid #ddd; border-radius: 6px; width: 60%; max-width: 400px;">
                                                <img class="img-fluid" src="<%=url%>/GUI/imgvoucher/<%=maGiamGia.getHinhanhvoucher()%>" style="width: 62px; height: 62px; object-fit: cover;">
                                                <div style="flex: 1;">
                                                    <p style="margin: 0; font-size: 14px; font-weight: bold;"><%= maGiamGia.getTenMaGiamGia()%></p>
                                                    <small class="text-muted">EXP: <%= maGiamGia.getNgayHetHan()%></small>
                                                </div>
                                                <input type="radio" name="voucher" value="voucher25">
                                            </div>



                                            <%
                                                    }
                                                }
                                            %>
                                            <!--                                        
                                                                                    <div class="row mb-3">
                                                                                        <div class="card-item" style="display: flex; align-items: center; gap: 10px; padding: 8px; border: 1px solid #ddd; border-radius: 6px; width: 60%; max-width: 400px;">
                                                                                            <img class="img-fluid" src="<%=url1%>/GUI/imgvoucher/voucher.png" style="width: 62px; height: 62px; object-fit: cover;">
                                                                                            <div style="flex: 1;">
                                                                                                <p style="margin: 0; font-size: 14px; font-weight: bold;">Giảm 25% cho đơn hàng từ 100k</p>
                                                                                                <small class="text-muted">EXP: 15-02-2025</small>
                                                                                            </div>
                                                                                            <input type="radio" name="voucher" value="voucher25">
                                                                                        </div>-->
                                           
                                            <hr class="my-2">
                                            <div class="row ">
                                                <div class="col">
                                                    <div class="row justify-content-between">
                                                        <div class="col-4">
                                                            <p class="mb-1"><b>Subtotal</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto">
                                                            <p class="mb-1"><b></b></p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col">
                                                            <p class="mb-1"><b>Shipping</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto">
                                                            <p class="mb-1"><b>10</b></p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4">
                                                            <p><b>Total</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto">
                                                            <p class="mb-1"><b>10</b></p>
                                                        </div>
                                                    </div>
                                                    <hr class="my-0">
                                                </div>
                                            </div>
                                            <div class="row mb-5 mt-4 ">
                                                <div class="col-md-7 col-lg-6 mx-auto"><button type="submit" class="btn btn-block btn-outline-primary btn-lg">Purchase</button></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="soluongsanpham" value="<%=i%>">
                </form>
            </div>				                            