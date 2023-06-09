<%-- 
    Document   : room
    Created on : Mar 6, 2023, 11:07:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<style>
    .a-page{
        font-size: 16px;
        text-decoration: none;
        padding: 5px 15px;
        color: white;
        background-color: #03A9F4;
    }
</style>
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
                            <li class="active"><a href="room">Rooms</a></li>
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
<div class="row" style="height: 750px">
    <section class="back d-flex flex-column align-items-center">
        <div class="notification-table-wrapper">
            <h3>
                Thông báo
                </h6>
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active rounded-pill" id="pills-home-tab" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="true">Tất cả</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile"
                                aria-selected="false">Chưa đọc</button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                         aria-labelledby="pills-home-tab">
                        <h6>
                            Mới
                        </h6>
                        <div class="d-flex flex-column gap-3">
                            <div class="d-flex justify-content-between align-items-center gap-2">
                                <div class="d-flex gap-2 align-items-center">
                                    <img src="data:image/jpeg;base64,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"
                                         class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;" />
                                    <div>
                                        <p class="mb-0">
                                            <span style="font-weight: bold;">Nguyễn Lâm</span> đã thêm vào tin của mình
                                        </p>
                                        <p class="mb-0" style="color: #005eff;">23 phúc trước</p>
                                    </div>
                                </div>
                                <i class="fa-solid fa-circle" style="color: #005eff;"></i>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex gap-2 align-items-center">
                                    <img src="data:image/jpeg;base64,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"
                                         class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;" />
                                    <div>
                                        <p class="mb-0">
                                            <span style="font-weight: bold;">Nguyễn Lâm</span> đã thêm vào tin của mình
                                            trung đức
                                            nè abcd xyz lmn o á
                                        </p>
                                        <p class="mb-0" style="color: #005eff;">23 phúc trước</p>
                                    </div>
                                </div>
                                <i class="fa-solid fa-circle" style="color: #ffffff;"></i>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        Profile
                    </div>
                </div>
        </div>
    </section>
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

<!-- Js Function -->
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

    function bookRooms() {
        var form = document.getElementById('frm-rooms');
        form.submit();
    }

    function deselect(roomId) {
        var roomAdd = document.getElementById('slt-' + roomId);
        var btn = document.getElementById('btn-' + roomId);

        // Hide the room by changing its display style
        roomAdd.style.display = 'none';
        btn.disabled = false;
        btn.style.backgroundColor = 'white';
        btn.style.color = 'green';
    }
    function submitFrm() {
        var frm = document.getElementById('frm-search');
        frm.submit();
    }
    var selectedRooms = [];
    window.onload = function () {
        var storedData = localStorage.getItem('cart');
        var data = JSON.parse(storedData);
        selectedRooms = data;
    };
    function addRoom(roomId) {
        var form = document.getElementById('frm-rooms');
        var roomAdd = document.getElementById('slt-' + roomId);
        var btn = document.getElementById('btn-' + roomId);
        //Save room selected to local storage
        selectedRooms.push(roomId);
        // Convert the object to JSON string
        var jsonString = JSON.stringify(selectedRooms);
        // Save the JSON string to local storage
        localStorage.setItem('cart', jsonString);
        // Show the room by changing its display style
        roomAdd.style.display = 'block';
        btn.disabled = true;
        // Append the customDiv to the form
        form.appendChild(roomAdd);
        btn.style.backgroundColor = 'green';
        btn.style.color = 'black';
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