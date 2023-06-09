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
                            <li class="active">Room</li>
                            <li><a href="./about-us.jsp">About Us</a></li>

                            <li><a href="./blog.jsp">News</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                                <c:if test="${sessionScope.acc.role.id == 1}">
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

<!---Search bar---->
<form id="frm-search" action="room" method="post" onbeforeunload="bookRooms()">
    <input type="hidden" name="action" value="search"/>
    <div class="w-100 justify-content-center d-flex">
        <div class="search-hotel-background">
            <div class="pt-3 pb-3 ps-3 pe-3">
                <div class="mt-4">
                    <div class="row gx-3">
                        <div class="col">
                            <h6 class="head-title-6 col-4">Min price:</h6>
                        </div>
                        <div class="col">
                            <h6 class="head-title-6 col-4">Max price:</h6>
                        </div>
                    </div>
                    <div class="row gx-3">
                        <div class="col">
                            <div
                                class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2">
                                $ <input name="minPrice" style="border: none; outline:none;" id="minPrice"
                                         min="1" step="1" type="number" oninput="validateMin()"
                                         class="form-control" value="${minPrice}"
                                         placeholder="00.000000">
                            </div>
                        </div>
                        <div class="col">
                            <div class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2"
                                 style="height: 46px;">
                                $ <input name="maxPrice" style="border: none; outline:none;"  oninput="validateMax()" id="maxPrice"
                                         min="1" step="1" type="number" class="form-control" value="${maxPrice}"
                                         placeholder="9999999999999">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-4">
                    <div class="d-flex justify-content-between gap-3">
                        <div class="w-100" style="width: max-content;">
                            <div class="row gx-3">
                                <div class="col"><h6 class="head-title-6">People:</h6></div>
                                <div class="col"><h6 class="head-title-6">Bed:</h6></div>
                                <div class="col"><h6 class="head-title-6">Room:</h6></div>
                                <div class="col"><h6 class="head-title-6">Bath Room:</h6></div>
                            </div>
                            <div class="row gx-3">
                                <div class="col">
                                    <div
                                        class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2">
                                        <img src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/a/ae73fa0a5c08e7064d9dafe34d1408e8.svg"
                                             width="24" height="24">
                                        <input style="border: none; outline:none;" min="1" step="1" type="number" id="datepicker"
                                               placeholder="People" min="1" class="form-control" name="minPeople" value="${minPeople}"
                                               pattern="[0-9]*" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                    </div>
                                </div>
                                <div class="col">
                                    <div
                                        class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2">
                                        <img
                                            src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/c/c129054df5ccd27157e3257819d5af9d.svg">
                                        <input style="border: none; outline:none;" min="1" step="1" type="number" name="minBed"  id="datepicker"
                                               placeholder="Bed" class="form-control" value="${minBed}"
                                               pattern="[0-9]*" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                    </div>
                                </div>
                                <div class="col">
                                    <div
                                        class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2">
                                        <img
                                            src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/c/c129054df5ccd27157e3257819d5af9d.svg">
                                        <input style="border: none; outline:none;" min="1" step="1" type="number" name="minRoom" id="datepicker"
                                               placeholder="Room" class="form-control" value="${minRoom}"
                                               pattern="[0-9]*" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                    </div>
                                </div>
                                <div class="col">
                                    <div
                                        class="border border-secondary rounded-2 ps-2 pe-2 pt-1 pb-1 d-flex align-items-center gap-2">
                                        <img
                                            src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/c/c129054df5ccd27157e3257819d5af9d.svg">
                                        <input style="border: none; outline:none;" min="1" step="1" type="number" name="minBathRoom" id="datepicker"
                                               placeholder="Room" class="form-control" value="${minBathRoom}"
                                               pattern="[0-9]*" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center align-items-center
                             pt-2 pb-2 ps-3 pe-3 rounded-3 search-btn" onclick="submitFrm()"
                             style="background-color: #ff5e1f; width: 300px;height: 15%;margin-top: 4%">
                            <i style="color: white;" class="me-2 fa-solid fa-white fa-magnifying-glass"></i>
                            <button class="border-0" style="background-color: #ff5e1f;color: white">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- End search -->

<!-- Breadcrumb Section End -->
<div class="row" style="height: 750px">
    <!-- Rooms Section Begin -->
    <div class="col-md-3">
        <nav id="nav" class="w-100" style="overflow-y: auto;max-height: 700px;overflow-x: hidden;">
            <div class="w-100 pl-3 text-center mr-0">
                <p class="fw-bold  mt-4">Your selected room: </p>
            </div>
            <!-- Room selected -->
            <form id="frm-rooms" action="room" method="post">
                <!--print out room is add before-->
                <c:forEach var="r" items="${roomslt}">
                    <div id="slt-${r.id}" style="display: block">
                        <div class="row border border-secondary rounded-2">
                            <div class="col-md-5 text-center pt-4">
                                <p class="fw-bold display-6">${r.roomNumber}</p>
                                <input type="hidden" name="roomID" value="${r.id}"/>
                            </div>
                            <div class="col-md-7 text-center">
                                <button type="button" class="btn btn-outline-danger w-100" onclick="deselect('${r.id}')"
                                        style="margin-top: 20%;margin-right: 5%;width: 30%;">Deselected</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <input type="hidden" value="book" name="action">
                <input type="hidden" value="${sessionScope.acc.id}" name="uid">
            </form>

            <div class="text-center w-100">
                <button type="button" onclick="bookRooms()" class="btn btn-outline-info mt-3">Book</button>
            </div>
        </nav>
    </div>
    <div class="col-md-9">
        <div class="hotel-background">
            <div class="list-top-hotel row g-4" id="list-room">
                <c:forEach items="${listRoom}" var="r">
                    <div class="col-6 col-md-3 mb-3">
                        <div class="hotel-card-wrapper rounded-2 border border-secondary" style="width: 90%;">
                            <div class="position-relative image-hotel-detail" data-bs-toggle="modal"
                                 data-bs-target="#detailHotelModal-${r.type.id}">
                                <img src="img/room/${r.type.image}" alt="new-prd" class="hotel-card-img w-100 rounded-top-2" />
                                <div class="detail-background position-absolute top-0 bottom-0 start-0 end-0 align-items-center d-flex justify-content-center"
                                     style="background-color:#6fe1f0">
                                    <div class="border-white border px-4 py-2 text-white">
                                        See Detail
                                    </div>
                                </div>
                            </div>
                            <div class="row w-100 text-center d-flex">
                                <p class="fw-bold">${r.roomNumber} - <em style="color: green">${r.status.name}</em></p>
                                <p class="fw-bold">${r.type.name}</p>
                            </div>
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <button type="button" id="btn-${r.id}"
                                            onclick="addRoom('${r.id}')" class="btn btn-outline-success w-70" style="margin-top: 10%">Select</button>
                                </div>
                                <div class="col-md-5">
                                    Only <p class="fw-bold lead display-7">${r.type.price}$</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="slt-${r.id}" style="display: none">
                        <div class="row border border-secondary rounded-2">
                            <div class="col-md-5 text-center pt-4">
                                <p class="fw-bold display-6">${r.roomNumber}</p>
                                <input type="hidden" name="roomID" value="${r.id}"/>
                            </div>
                            <div class="col-md-7 text-center">
                                <button type="button" class="btn btn-outline-danger w-100" onclick="deselect('${r.id}')"
                                        style="margin-top: 20%;margin-right: 5%;width: 30%;">Deselected</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div id="page" class="text-center">
                    <%--For displaying Previous link except for the 1st page --%>
                    <c:if test="${currentPage != 1}">
                        <td><a class="a-page" href="room?page=${currentPage - 1}">Previous</a></td>
                    </c:if>

                    <%--For displaying Page numbers. The when condition does not display
                                a link for the current page--%>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${currentPage eq i}">
                                ${i}
                            </c:when>
                            <c:otherwise>
                                <a class="a-page" href="room?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                        <a class="a-page" href="room?page=${currentPage + 1}">Next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Rooms Section End -->
</div>
<!-- Modal -->
<c:forEach items="${types}" var="t">
    <div class="modal fade modal-detail-wrapper" id="detailHotelModal-${t.id}" tabindex="-${t.id}"
         aria-labelledby="detailHotelModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #86b817; ">
                    <h5 class="modal-title" style="font-size: 14px; line-height: 22px; color: white;"
                        id="detailHotelModalLabel">Details</h5>
                    <div class="d-flex gap-1 align-items-center" style="cursor: pointer;" data-bs-dismiss="modal">
                        <p class="mb-0" style="font-size: 14px; line-height: 22px; color: white;">Close</p>
                        <i class="fa-solid fa-xmark" style="color: #ffffff;"></i>
                    </div>
                </div>
                <div class="modal-body"
                     style="border: 1px solid #e3e3e3; padding-left: 16px; padding-right: 16px; padding-bottom: 12px; margin: 4px;">
                    <div class="w-100 text-center">
                        <h1 class="title-detail-hotel" style="margin-top: 8px;">${t.name} room detail</h1>
                    </div>
                    <h1 class="title-detail-hotel">Room Details</h1>
                    <div class="ps-4 pe-4">
                        <p class="mb-0"> - Max:  ${t.maxPeople} people</p>
                        <p class="mb-0"> - Bed:  ${t.bed} bed </p>
                        <p class="mb-0"> - Room(s):  ${t.numberOfRoom} rooms </p>
                        <p class="mb-0"> - Bathroom(s):  ${t.bathroom} Bathrooms </p>
                    </div>
                    <h1 class="title-detail-hotel">Service included:</h1>
                    <!-- information wrapper  -->
                    <div class="ps-4 pe-4">
                        <!-- insert list here -->
                        <div class="d-flex align-items-center gap-1">
                            <i style="color: #4790cd" class="fa-regular fa-circle-check mb-0"></i>
                            <p style="font-weight: 500; font-size: 14px;" class="mb-0">Breakfast buffet at the restaurant
                                Panorama for numbers
                                standard adult size
                                in room
                                or villa and 2 children under 16 years old</p>
                        </div>
                        <div class="d-flex align-items-center gap-1">
                            <i style="color: #4790cd" class="fa-regular fa-circle-check mb-0"></i>
                            <p style="font-weight: 500; font-size: 14px;" class="mb-0">Free 1 round of drinks
                                in the mini bar (only applicable on pick up date
                                room)</p>
                        </div>
                    </div>
                    <h1 class="title-detail-hotel">Note & Policy</h1>
                    <div class="ps-4 pe-4">
                        <h4 class="note-hotel-italic">Note:</h4>
                        <p class="mb-0">- Promotion applies to individual bookings from 1-7 rooms, for Vietnamese guests,
                            Vietnamese guests
                            Kieu and Expat guests (foreigner community temporarily residing in Vietnam)</p>
                        <p class="mb-0">- Not to be combined with other promotions</p>
                        <div class="mt-3">For more details and to book promotions. Please contact hotline
                            <span style="font-size:13px; font-weight: bold;">
                                1900 5454 40
                            </span>
                            or email datphong@chudu24.com
                        </div>
                    </div>
                </div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div> -->
            </div>
        </div>
    </div>
</c:forEach>
<!-- End Modal -->

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

                                    function submitFrm() {
                                        var frm = document.getElementById('frm-search');
                                        frm.submit();
                                    }
                                    var selectedRooms = [];

                                    //get data from cart
                                    window.onload = function () {
                                        var cookieValue = document.cookie
                                                .split(';')
                                                .find(cookie => cookie.trim().startsWith('cart_${sessionScope.acc.telephone}='));

                                        if (cookieValue) {
                                            var decodedArray = decodeURIComponent(cookieValue.split('=')[1]).split(';'); // Use the same delimiter
                                            selectedRooms = decodedArray;
                                        }
                                        for (var i = 0; i < selectedRooms.length; i++) {
                                            var btn = document.getElementById("btn-" + selectedRooms[i]);
                                            btn.disabled = true;
                                            btn.style.backgroundColor = 'green';
                                            btn.style.color = 'black';
                                        }
                                    };

                                    function addRoom(roomId) {
                                        var form = document.getElementById('frm-rooms');
                                        var roomAdd = document.getElementById('slt-' + roomId);
                                        var btn = document.getElementById('btn-' + roomId);

                                        //Save room selected to local storage
                                        selectedRooms.push(roomId);

                                        var encodedArray = selectedRooms.join(';');
                                        document.cookie = "cart_${sessionScope.acc.telephone}=" + encodeURIComponent(encodedArray);

                                        // Show the room by changing its display style
                                        roomAdd.style.display = 'block';
                                        btn.disabled = true;
                                        // Append the customDiv to the form
                                        form.appendChild(roomAdd);
                                        btn.style.backgroundColor = 'green';
                                        btn.style.color = 'black';
                                    }

                                    function bookRooms() {
                                        var form = document.getElementById('frm-rooms');
                                        if (${sessionScope.acc == null}) {
                                            alert("You need to login to booking");
                                        } else {
                                            if (selectedRooms.length > 0) {
                                                form.submit();
                                            } else {
                                                alert("You need to choose room to booking");
                                            }
                                        }
                                    }

                                    function deselect(roomId) {
                                        var roomAdd = document.getElementById('slt-' + roomId);
                                        var btn = document.getElementById('btn-' + roomId);
                                        //
                                        selectedRooms = selectedRooms.filter(function (item) {
                                            return item !== roomId;
                                        });

                                        var encodedArray = selectedRooms.join(';');
                                        document.cookie = "cart_${sessionScope.acc.telephone}=" + encodeURIComponent(encodedArray);

                                        // Hide the room by changing its display style
                                        roomAdd.style.display = 'none';
                                        btn.disabled = false;
                                        btn.style.backgroundColor = 'white';
                                        btn.style.color = 'green';
                                    }
                                    function validateMin() {
                                        var input = document.getElementById("minPrice");
                                        var value = input.value;

                                        if (value < 0) {
                                            input.value = Math.abs(value);
                                        }
                                    }
                                    function validateMax() {
                                        var minInput = document.getElementById("minPrice");
                                        var maxInput = document.getElementById("maxPrice");

                                        var minValue = parseFloat(minInput.value);
                                        var maxValue = parseFloat(maxInput.value);

                                        if (maxValue < 0) {
                                            maxInput.value = Math.abs(maxValue);
                                        }

                                        if (maxValue < minValue) {
                                            maxInput.value = minValue;
                                        }
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