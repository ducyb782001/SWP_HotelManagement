<%-- 
    Document   : room-details
    Created on : Mar 6, 2023, 11:11:26 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
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
                    </nav>
                    <div class="nav-right search-switch">
                        <i class="icon_search"></i>
                    </div>
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

<!-- Room Details Section Begin -->
<section class="room-details-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <c:forEach var="roomt" items="${roomt}">
                <div class="room-details-item">
                    <img src="${roomt.image}" alt="">
                    <div class="rd-text">
                        <div class="rd-title">
                            <h3>${roomt.name}</h3>
                            <div class="rdt-right">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star-half_alt"></i>
                                </div>
<!--                                <a href="#">Login</a>-->
                            </div>
                        </div>
                        <h2>${roomt.price} $<span>/Pernight</span></h2>
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
                                <tr>
                                    <td class="r-o">Services:</td>
                                    <td>${roomt.service}</td>
                                </tr>
                            </tbody>
                        </table>
                                <p class="f-para"><p>${roomt.details}
                        </p>
                    </div>
                </div>
                </c:forEach>
                <div class="rd-reviews">
                    <h4>Reviews</h4>
                    <c:forEach var="roomdetail" items="${listrw}">
                    <div class="review-item">
                        
                        <div class="ri-text">
                            <span><script>document.write(new Date().getMonth());</script><script>document.write(new Date().getFullYear();</script></span>
                            <div class="rating">
                                <i class="icon_star"></i>
                                <i class="icon_star"></i>
                                <i class="icon_star"></i>
                                <i class="icon_star"></i>
                                <i class="icon_star-half_alt"></i>
                            </div>
                            <h5>${sessionScope.acc.fullName}</h5>
                            <p>${review.yourreview}</p>
                        </div>
                    </div>
                    </c:forEach>
                   
                </div>
                <c:if test="${sessionScope.acc != null}">
                    <div class="review-add">
                        <h4>Add Review</h4>
                        <form action="roomdetail?typeId=" method="post"class="ra-form">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" name="fullname"value="${sessionScope.acc.fullName}"placeholder="Name*">
                                </div>
                                <div class="col-lg-6">
                                    <input name="email"value="${sessionScope.acc.email}" type="text" placeholder="Email*">
                                </div>
                                <div class="col-lg-6">
                                    <input name="accountId"value="${sessionScope.acc.accountId}" type="hidden" >
                                </div>
                                <div class="col-lg-12">
                                    <div>
                                        <h5>You Rating:</h5>
                                        <div class="rating">
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star-half_alt"></i>
                                        </div>
                                    </div>
                                    <textarea name="review" placeholder="Your Review"></textarea>
                                    <button type="submit">Submit Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </div>
            <div class="col-lg-4">
                <div class="room-booking">
                    <h3>Your Reservation</h3>
                    <form action="#">
                        <div class="check-date">
                            <label for="date-in">Check In:</label>
                            <input type="text" class="date-input" id="date-in">
                            <i class="icon_calendar"></i>
                        </div>
                        <div class="check-date">
                            <label for="date-out">Check Out:</label>
                            <input type="text" class="date-input" id="date-out">
                            <i class="icon_calendar"></i>
                        </div>
                        <div class="select-option">
                            <label for="guest">Guests:</label>
                            <select id="guest">
                                <option value="">3 Adults</option>
                            </select>
                        </div>
                        <div class="select-option">
                            <label for="room">Room:</label>
                            <select id="room">
                                <option value="">1 Room</option>
                            </select>
                        </div>
                        <button type="submit">Check Availability</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Room Details Section End -->

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
                            <li>info.colorlib@gmail.com</li>
                            <li>856 Cordia Extension Apt. 356, Lake, United State</li>
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
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
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