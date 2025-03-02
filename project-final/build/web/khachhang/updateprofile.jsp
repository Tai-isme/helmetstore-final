<%
    String url1 = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%= url1 %>/GUI/css/bootstrap.css" />

  <!-- Custom styles for this template -->
  <link href="<%= url1 %>/GUI/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%= url1 %>/GUI/css/responsive.css" rel="stylesheet" />
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </head>
    <body>
    
        <%@include file="../GUI/header.jsp" %>
        <%
            if(khachHang==null){ 
        %>
        <h1 class="red">Bạn chưa đăng nhập</h1>
        <% 
            }else {
        %>
        <div class="row">
        <div class="col-12">
            <!-- Page title -->
            <div class="my-5">
                <h3>My Profile</h3>
                <hr>
            </div>
            <!-- Form START -->
            <form class="file-upload" method="post" action="../khach-hang">
                <input type="hidden" name="hanhdong" value="updateProfile"> 
                <div class="row mb-5 gx-5">
                    <!-- Contact detail -->
                    <div class="col-xxl-8 mb-5 mb-xxl-0">
                        <div class="bg-secondary-soft px-4 py-5 rounded">
                            <div class="row g-3">
                                <h4 class="mb-4 mt-0">Contact detail</h4>
                                <!-- Thêm ô nh?p mã khách hàng -->
                                <div class="col-md-6">
                                    <label class="form-label">Customer ID (Mã khách hàng) *</label>
                                    <input type="text" class="form-control" placeholder="Nhap ma khach hang" name="maKhachHang" required>
                                </div>

                                <!-- Full name -->
                                <div class="col-md-6">
                                    <label class="form-label">Full name</label>
                                    <input type="text" class="form-control" placeholder="" name="hoVaTen" >
                                </div>
                                <!-- Gender -->
                                <div class="col-md-6">
                                    <label class="form-label">Gender</label>
                                    <select class="form-control" name="gioiTinh">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option>
                                    </select>
                                </div>
                                <!-- Birthdate -->
                                <div class="col-md-6">
                                    <label class="form-label">Birthdate</label>
                                    <input type="date" class="form-control" placeholder="" name="ngaySinh" value="">
                                </div>
                                <!-- Mobile number -->
                                <div class="col-md-6">
                                    <label class="form-label">Phone number</label>
                                    <input type="text" class="form-control" placeholder="" name="soDienThoai" value="">
                                </div>
                                <!-- Email -->
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email *</label>
                                    <input type="email" class="form-control" id="inputEmail4" name="email" value="">
                                </div>
                                <!-- Country -->
                                <div class="col-md-6">
                                    <label class="form-label">Country</label>
                                    <input type="text" class="form-control" placeholder="" name="quocGia" value="">
                                </div>
                                <!-- Customer address -->
                                <div class="col-md-6">
                                    <label class="form-label">Customer address</label>
                                    <input type="text" class="form-control" placeholder="" name="diaChiKhachHang" value="">
                                </div>
                                <!-- Customer address order-->
                                <div class="col-md-6">
                                    <label class="form-label">Shipping address</label>
                                    <input type="text" class="form-control" placeholder="" name="diaChiGiaoHang" value="">
                                </div>
                                <!-- Dang ky nhan ban tin -->
                                <div class="col-md-6">
                                    <label class="form-label">Sign up for email newsletter</label>
                                    <input type="checkbox" name="dangKyNhanBangTin">
                                </div>
                            </div> <!-- Row END -->
                        </div>
                    </div>
                    <!-- Upload profile -->
                    <div class="col-xxl-4">
                        <div class="bg-secondary-soft px-4 py-5 rounded">
                            <div class="row g-3">
                                <h4 class="mb-4 mt-0">Upload your profile photo</h4>
                                <div class="text-center">
                                    <!-- Image upload -->
                                    <div class="square position-relative display-2 mb-3">
                                        <i class="fas fa-fw fa-user position-absolute top-50 start-50 translate-middle text-secondary"></i>
                                    </div>
                                    <!-- Button -->
                                    <input type="file" id="customFile" name="file" hidden="">
                                    <button type="button" class="btn btn-danger-soft"><label class="btn btn-success-soft btn-block" for="customFile">Upload</label></button>

                                    <button type="button" class="btn btn-danger-soft">Remove</button>
                                    <!-- Content -->
                                    <p class="text-muted mt-3 mb-0"><span class="me-1">Note:</span>Minimum size 300px x 300px</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Row END -->

                <!-- button -->
                <div class="gap-3 d-md-flex justify-content-md-end text-center">
                    <button type="submit" class="btn btn-danger btn-lg">Delete profile</button>
                    <button type="submit" class="btn btn-primary btn-lg">Update profile</button>
                </div>
            </form> <!-- Form END -->
        </div>
    </div>

    <% } %>    
    </body>
</html>
