<%-- 
    Document   : room
    Created on : Mar 6, 2023, 11:07:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
   <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" type="text/css">

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
                                <input name="searchbyprice" value="${price}"class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">

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

<!-- Rooms Section Begin -->
<section class="rooms-section spad">
    <div class="container">
        <div class="row">
            <c:forEach var="roomt" items="${listrooma}">
               
            <div class="col-lg-4 col-md-6">
                <div class="room-item">
                    <img src="${roomt.image}" alt="">
                    <div class="ri-text">
                        <div class="rd-title ">
                            <h4>${roomt.name}</h4>
                        </div>
                        <h3>${roomt.price} $<span>/Pernight</span></h3>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="r-o">Size:</td>
                                    <td>30 ft</td>
                                </tr>
                                <tr>
                                    <td class="r-o">Capacity:</td>
                                    <td>${roomt.maxOccupancy}</td>
                                </tr>
                                <tr>
                                    <td class="r-o">Bed:</td>
                                    <td>${roomt.bed}</td>
                                </tr>
                                 
                               
                            </tbody>
                        </table>
                        <a href="roomdetail?typeId=${roomt.typeId}" class="primary-btn">More Details</a>
                        
                        
                       
                         
                    </div>
                </div>
            </div>
            
            </c:forEach>
            
            <div class="col-lg-12">
                <div class="room-pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Rooms Section End -->

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
                <div class="col-lg-5">
                    <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
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
        <form action="searchbyprice" method="post" class="search-model-form">
            <input type="text" name="price"id="search-input" placeholder="Search by price">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
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