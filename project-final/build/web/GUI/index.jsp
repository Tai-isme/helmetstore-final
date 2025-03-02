<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="database.SanPhamDAO"%>
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

    <body>
        <div class="hero_area">
            <!-- header -->
            <%@include file="header.jsp" %>
            <!-- header -->

            <!-- slider section -->
            <section class="slider_section">
                <div class="slider_container">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="detail-box">
                                                <h1>
                                                    Text
                                                </h1>
                                                <p>
                                                    text
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-5 ">
                                            <div class="img-box">
                                                <img src="<%= url1%>/GUI/images/saving-img.png" alt="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end slider section -->


            
            <!-- shop section -->

            <section class="shop_section layout_padding">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>
                            News arrivals
                        </h2>
                    </div>
                    <div class="row">
                        <%  SanPhamDAO dao = new SanPhamDAO();

                            List<SanPham> list = dao.selectAll();

                            if (list != null && !list.isEmpty()) {
                                int count = 0;
                                for (SanPham sanPham : list) {

                                    if (count == 8) {
                                        break;
                                    }
                                    count++;
                        %>
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <div class="box">
                                <a href="<%=url%>/sanpham/product-details.jsp?masanpham=<%=sanPham.getMasanpham()%>">
                                    <div class="img-box">
                                        <img src="<%= url1%>/GUI/imgsanpham/<%=sanPham.getHinhanhsanpham()%>" alt="Ảnh nón">
                                    </div>
                                    <div class="detail-box">
                                        <h6>
                                            Ring
                                        </h6>
                                        <h6>
                                            Price
                                            <span>
                                                $200
                                            </span>
                                        </h6>
                                    </div>
                                    <div class="new">
                                        <span>
                                            New
                                        </span>
                                    </div>
                                </a>
                            </div>

                        </div>
                        <%
                                }
                            }
                        %>


                    </div>
                    <div class="btn-box">
                        <a href="<%=url%>/GUI/shop.jsp">
                            View All Products
                        </a>
                    </div>
                </div>
            </section>
            <!-- end shop section -->

            <!-- gift section -->
            <section class="gift_section layout_padding-bottom">
                <h1 style="text-align: center">Voucher for you</h1>
                <div card-container>
                    <div class="card-item ">
                        <img class="card-img" alt="anh voucher" src="<%=url1%>/GUI/imgvoucher/voucher.png">
                        <div class="card-body">
                            <p style="font-size: 24px;font-weight: 500 " class="card-title">Giảm 25% cho đơn hàng từ 100k</p>
                            <p class="card-text"> <h5>EXP: <small class="text-muted">15-02-2025</small></h5> </p>
                        </div>
                        <form class="card-getvalue" action="chuaCoHanhDong">
                            <button class="btn btn-primary getValue">Get</button>
                        </form>
                    </div>

                </div>
            </section>


            <!-- end gift section -->

            <!-- info section -->
            <section class="info_section  layout_padding2-top">
                <div class="social_container">
                    <div class="social_box">
                        <a href="">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <div class="info_container ">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-lg-4">
                                <h6>
                                    Text
                                </h6>
                                <p>
                                    text
                                </p>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <h6>
                                    Text
                                </h6>
                                <p>
                                    Text
                                </p>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <h6>
                                    Text
                                </h6>
                                <div class="info_link-box">
                                    <a href="">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <span> text </span>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-phone" aria-hidden="true"></i>
                                        <span>text</span>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                        <span>text</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer section -->
                <footer class=" footer_section">
                    <div class="container">
                        <p>
                            &copy; <span id="displayYear"></span> All Rights Reserved By
                        </p>
                    </div>
                </footer>
                <!-- footer section -->

            </section>
            <!-- end info section -->

            <script src="<%= url1%>/GUI/js/jquery-3.4.1.min.js"></script>
            <script src="<%= url1%>/GUI/js/bootstrap.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
            </script>
            <script src="<%= url1%>/GUI/js/custom.js"></script>
        </div>
        <!-- end hero area -->
    </body>

</html>