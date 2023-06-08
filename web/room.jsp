<%-- 
    Document   : room
    Created on : Mar 6, 2023, 11:07:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<link href="css/hoteldetail.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<div class="menu-item">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="logo">
                    <a href="./home.jsp">
                        <img src="img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-10">
                <div class="nav-menu">
                    <nav class="mainmenu">
                        <ul>



                            <li><a href="home">Home</a></li>
                            <li class="active"><a href="roomtype">Rooms</a></li>
                            <li><a href="./about-us.jsp">About Us</a></li>

                            <li><a href="./blog.jsp">News</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                                <c:if test="${sessionScope.acc.role == 1}">
                                <li><a href="room">Admin Account</a>
                                    <ul class="dropdown">
                                        <li><a href="./room-details.jsp">User</a></li>
                                        <li><a href="./room-details-2.jsp">Room</a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#">Double Room</a></li>
                                    </ul>
                                </li>
                            </c:if>

                        </ul>
                        <nav class="navbar navbar-brand ">
                            <form action="searchbyprice" method="post" class="form-inline">
                                <input  name="searchbyprice" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">

                                <button type="submit" class="btn">
                                    <i class="icon_search"></i>
                                </button>
                            </form>
                        </nav>
                    </nav>

                </div>
            </div>
        </div>
    </div>
</div>
</header>
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>Our Rooms</h2>
                    <div class="bt-option">
                        <a href="./home.jsp">Home</a>
                        <span>Rooms</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->
<div class="row">
    <!-- Rooms Section Begin -->
    <div class="col-md-3" style="background-color: #EFD4B9">
        <nav id="nav">
            <div class="w-100 pl-3 text-center">
                <p class="fw-bold  mt-4">Your selected room: </p>
            </div>
            <div class="row border border-secondary rounded-2">
                <div class="col-md-5 text-center pt-4">
                    <p class="fw-bold display-6">R101</p>
                </div>
                <div class="col-md-7 text-center">
                    <button type="button" class="btn btn-outline-danger w-100"
                            style="margin-top: 20%;margin-right: 5%;width: 30%;">Deselected</button>
                </div>
            </div>
            <div class="w-100 pl-3 text-center">
                <button onclick="bookRooms()" class="btn-primary border-secondary rounded-2 mt-3">Book</button>
            </div>
        </nav>
    </div>
    <div class="col-md-9">
        <div class="hotel-background">
            <div class="list-top-hotel row g-4">
                <c:forEach items="${listRoom}" var="r">
                    <div class="col-6 col-md-3 mb-3">
                        <div class="hotel-card-wrapper rounded-2 border border-secondary" style="width: 90%;">
                            <div class="position-relative image-hotel-detail" data-bs-toggle="modal"
                                 data-bs-target="#detailHotelModal">
                                <img src="img/room/room-2.jpg" alt="new-prd" class="hotel-card-img w-100 rounded-top-2" />
                                <div class="detail-background position-absolute top-0 bottom-0 start-0 end-0 align-items-center d-flex justify-content-center"
                                     style="background-color:#6fe1f0">
                                    <div class="border-white border px-4 py-2 text-white">
                                        See Detail
                                    </div>
                                </div>
                            </div>
                            <div class="row w-100 text-center d-flex">
                                <p class="fw-bold">${r.id} - <em style="color: green">${r.status.name}</em></p>
                            </div>
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <button type="button" class="btn btn-outline-danger"
                                            style="margin-top: 15%;margin-right: 5%;width: 30%;"> - </button>
                                    <button type="button" onclick="addRoom('${r.id}')" class="btn btn-outline-success" style="margin-top: 15%;width: 32%;"> +
                                    </button>
                                </div>
                                <div class="col-md-5">
                                    Only <p class="fw-bold lead display-7">${r.type.price}$</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Rooms Section End -->
</div>
<!-- Modal -->
<div class="modal fade modal-detail-wrapper" id="detailHotelModal" tabindex="-1"
     aria-labelledby="detailHotelModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #86b817; ">
                <h5 class="modal-title" style="font-size: 14px; line-height: 22px; color: white;"
                    id="detailHotelModalLabel">Chi
                    tiết khuyến mãi MOVEMENT PICK CAM RANH</h5>
                <div class="d-flex gap-1 align-items-center" style="cursor: pointer;" data-bs-dismiss="modal">
                    <p class="mb-0" style="font-size: 14px; line-height: 22px; color: white;">Đóng</p>
                    <i class="fa-solid fa-xmark" style="color: #ffffff;"></i>
                </div>
            </div>
            <div class="modal-body"
                 style="border: 1px solid #e3e3e3; padding-left: 16px; padding-right: 16px; padding-bottom: 12px; margin: 4px;">
                <h1 class="title-detail-hotel" style="margin-top: 8px;">Chi tiết giá phòng "Khu căn hộ | Studio
                    Hướng Biển 1 giường đôi - Ưu
                    đãi đặt đến 30/06 | Khách
                    Việt - Miễn phí 2 trẻ - Hoàn hủy linh hoạt"</h1>
                <div class="row">
                    <div class="col-md-6 pt-2 pb-2 text-center" style="border: 1px solid #e3e3e3; font-size: 13px;">
                        Giai đoạn <span style="font-weight: bold;">Đặt và Sử Dụng</span>
                    </div>
                    <div class="col-md-6 pt-2 pb-2 text-center" style="border: 1px solid #e3e3e3; font-size: 13px;">
                        <span style="font-weight: bold;">Giá thấp nhất</span>/ 1 đêm
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 pt-2 pb-2 mx-auto row d-flex justify-content-center"
                         style="border: 1px solid #e3e3e3; font-size: 13px;">
                        <div class="col-md-10 row">
                            <div class="col-md-5">Giai đoạn Đặt:</div>
                            <div class="col-md-7">31/05/2023 - 30/06/2023</div>
                        </div>
                        <div class="col-md-10 row">
                            <div class="col-md-5">Giai đoạn Sử Dụng:</div>
                            <div class="col-md-7">31/05/2023 - 31/08/2023</div>
                        </div>
                    </div>
                    <div class="col-md-6 pt-2 pb-2 mx-auto row d-flex justify-content-center"
                         style="border: 1px solid #e3e3e3; font-size: 13px;">
                        Gọi <span style="color: #86b817;">1900 5454 40</span> để có giá rất tốt <span
                            style="color: #86b817;">(Tại sao?)</span>
                    </div>
                </div>
                <div class="row mt-4" style="font-size: 13px">
                    <h4 class="col-md-6" style="color: #777; font-size: 13px;">Điền <span
                            style="font-weight: 600; color: black;">Ngày Nhận Phòng & Trả Phòng</span> để xem giá
                        theo ngày
                        cụ thể & ưu đãi khác
                        tại khách sạn này</h4>
                    <div class="col-md-6 d-flex gap-2 align-items-center">
                        <div style="color: #4790cd;">Nhận phòng</div>
                        <input style="width: 140px;" type="date" id="datepicker" class="form-control">
                        <div style="color: #4790cd;">Trả phòng</div>
                        <input style="width: 140px;" type="date" id="datepicker" class="form-control">
                        <button type="button"
                                style="background-color: #86b817; color: white; outline:none; border: none"> <span
                                class="btn-label"><i class="me-1 fa-solid fa-magnifying-glass"></i></span>Tìm
                            kiếm</button>
                    </div>
                </div>
                <h1 class="title-detail-hotel">Giá phòng bao gồm</h1>
                <!-- information wrapper  -->
                <div class="ps-4 pe-4">
                    <!-- insert list here -->
                    <div class="d-flex align-items-center gap-1">
                        <i style="color: #4790cd" class="fa-regular fa-circle-check mb-0"></i>
                        <p style="font-weight: 500; font-size: 14px;" class="mb-0">Ăn sáng buffet tại nhà hàng
                            Panorama dành cho số
                            lượng người lớn tiêu chuẩn
                            trong phòng
                            hoặc biệt thự và 2 trẻ dưới 16 tuổi</p>
                    </div>
                    <div class="d-flex align-items-center gap-1">
                        <i style="color: #4790cd" class="fa-regular fa-circle-check mb-0"></i>
                        <p style="font-weight: 500; font-size: 14px;" class="mb-0"> Miễn phí 1 lượt các loại đồ uống
                            trong mini bar (chỉ áp dụng ngày nhận
                            phòng)</p>
                    </div>
                </div>
                <h1 class="title-detail-hotel">Lưu ý & chính sách</h1>
                <div class="ps-4 pe-4">
                    <h4 class="note-hotel-italic">Lưu ý:</h4>
                    <p class="mb-0">- Khuyến mãi áp dụng cho các đặt phòng lẻ từ 1-7 phòng, dành cho khách Việt Nam,
                        khách Việt
                        Kiều và khách Expat (cộng đồng người nước ngoài đang tạm trú tại Việt Nam)</p>
                    <p class="mb-0">- Không kết hợp đồng thời với các khuyến mãi khác</p>
                    <div class="mt-3">Để biết thêm chi tiết và đặt chương trình khuyến mãi. Vui lòng liên hệ hotline
                        <span style="font-size:13px; font-weight: bold;">
                            1900 5454 40
                        </span>
                        hoặc email datphong@chudu24.com
                    </div>
                </div>
                <h1 class="title-detail-hotel">Điều kiện hủy phòng</h1>
                <div class="ps-4 pe-4">
                    <p class="mb-0">- Hủy phòng trước 10 ngày (trừ thứ 7, chủ nhật, Lễ Tết) so với ngày nhận phòng:
                        Không tính
                        phí</p>
                    <p class="mb-0">- Hủy phòng trong 10 ngày (trừ thứ 7, chủ nhật, Lễ Tết) so với ngày nhận phòng:
                        Không tính
                        phí</p>

                    <h4 class="note-hotel-italic mt-3">Các yêu cầu về thay đổi giai đoạn ở, rút ngắn thời gian lưu
                        trú
                        hay giảm số lượng phòng,
                        thay đổi tên khách đều được xem là hủy phòng và áp dụng chính sách hủy trên.</h4>
                </div>
            </div>
            <!-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div> -->
        </div>
    </div>
</div>
<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="footer-text">
            <div class="row">
                <div class="col-lg-4">
                    <div class="ft-about">
                        <div class="logo">
                            <a href="#">
                                <img src="img/footer-logo.png" alt="">
                            </a>
                        </div>
                        <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                        <div class="fa-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-contact">
                        <h6>Contact Us</h6>
                        <ul>
                            <li>(12) 345 67890</li>
                            <li>hotelbookingsystem.01@gmail.com</li>
                            <li>Khu đô thị FPT City, Đà Nẵng</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-newslatter">
                        <h6>New latest</h6>
                        <p>Get the latest updates and offers.</p>
                        <form action="#" class="fn-form">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <ul>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Terms of use</a></li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Environmental Policy</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form action="search" method="post"class="search-model-form">
            <input type="text" name="index" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
<script>
                                        function loadMore() {
                                            var amount = document.getElementsByClassName("product").length;
                                            $.ajax({
                                                url: "/Project_banhang/load",
                                                type: "get", //send it through get method
                                                data: {
                                                    exits: amount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML += data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }
                                        function searchByPrice(param) {
                                            var txtSearch = param.value;
                                            $.ajax({
                                                url: "/HotelOnlineSystem/searchajax",
                                                type: "get", //send it through get method
                                                data: {
                                                    searchbyprice: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        var selectedRooms = [];

                                        function addRoom(roomId) {
                                            selectedRooms.push(roomId);
                                        }

                                        function bookRooms() {
                                            // Send the selectedRooms list to the server
                                            $.ajax({
                                                type: 'POST',
                                                url: 'room',
                                                data: {selectedRooms: selectedRooms},
                                                success: function (response) {
                                                    // Handle the server response
                                                },
                                                error: function (xhr, status, error) {
                                                    // Handle any errors
                                                }
                                            });
                                        }


</script>  
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

</body>

</html>