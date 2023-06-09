<%-- 
    Document   : header
    Created on : Mar 6, 2023, 8:18:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>

<%
  LocalDate currentDate = LocalDate.now();
  String dateString = currentDate.toString(); // or use a DateTimeFormatter to format the date string
%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style_2.css" type="text/css">
        <link href="css/hoteldetail.css" rel="stylesheet" type="text/css"/>
        <link href="css/notification.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <style>
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                top: 30px; /* Change the bottom position to top position */
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Change the bottom position to top position */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Change the bottom position to top position */
            }

            @keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Change the bottom position to top position */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Change the bottom position to top position */
            }

            @-webkit-keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Change the bottom position to top position */
                to {
                    top: 0;
                    opacity: 0;
                } /* Change the bottom position to top position */
            }

            @keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Change the bottom position to top position */
                to {
                    top: 0;
                    opacity: 0;
                } /* Change the bottom position to top position */
            }
        </style>
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <c:if test="${msg != null}">
            <!-- Navbar display message -->
            <div id="snackbar">${msg}</div>
            <script>
                var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
            </script>
        </c:if>
        <!-- Offcanvas Menu Section Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="canvas-open">
            <i class="icon_menu"></i>
        </div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <i class="icon_close"></i>
            </div>
            <div class="search-icon  search-switch">
                <i class="icon_search"></i>
            </div>
            <div class="header-configure-area">
                <div class="language-option">
                    <img src="img/flag.jpg" alt="">
                    <span>EN <i class="fa fa-angle-down"></i></span>
                    <div class="flag-dropdown">
                        <ul>
                            <li><a href="#">Zi</a></li>
                            <li><a href="#">Fr</a></li>
                        </ul>
                    </div>
                </div>
                <a href="login.jsp" class="bk-btn">Login</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li class="active"><a href="./home.jsp">Home</a></li>
                    <li><a href="./room.jsp">Rooms</a></li>
                    <li><a href="./about-us.jsp">About Us</a></li>
                    <li><a href="room.jsp">Room Details</a>
                        <ul class="dropdown">
                            <li><a href="./room-details.jsp">Premium King Room</a></li>
                            <li><a href="#">Deluxe Room</a></li>
                            <li><a href="#">Family Room</a></li>
                            <li><a href="#">Double Room</a></li>
                        </ul>
                    </li>
                    <li><a href="./blog.jsp">News</a></li>
                    <li><a href="./contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <c:if test="${sessionScope.acc !=null}">
                    <a href="#"><i class="fa "></i>Hello ${sessionScope.acc.fullName}</a>
                    <a href="logout" class="bk-btn">Logout</a>
                </c:if>
                <c:if test="${sessionScope.acc ==null}">
                    <a href="login.jsp" class="bk-btn">Login</a>
                </c:if>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> ${sessionScope.acc.telephone}</li>
                <li><i class="fa fa-envelope"></i> ${sessionScope.acc.email}</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="top-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="tn-left">
                                <li><i class="fa fa-phone"></i> ${sessionScope.acc.telephone}</li>
                                <li><i class="fa fa-envelope"></i> ${sessionScope.acc.email}</li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <div class="tn-right">


                                <c:if test="${sessionScope.acc !=null}">
                                    <a href="#"><i class="fa "></i>Hello ${sessionScope.acc.fullName}</a>
                                    <a href="logout" class="bk-btn">Logout</a>
                                </c:if>
                                <c:if test="${sessionScope.acc ==null}">
                                    <a href="login.jsp" class="bk-btn">Login</a>
                                </c:if>
                                <div class="language-option">
                                    <img src="img/flag.jpg" alt="">
                                    <span>EN <i class="fa fa-angle-down"></i></span>
                                    <div class="flag-dropdown">
                                        <ul>
                                            <li><a href="#">Zi</a></li>
                                            <li><a href="#">Fr</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>