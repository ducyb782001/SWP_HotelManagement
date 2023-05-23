<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <!--         <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">-->
        <!--        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">-->
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style_2.css" type="text/css">


        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
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

            <!-- Edit Modal HTML -->
            
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editroomtype" method="post">

                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Room Types</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Room Type ID</label>
                                    <input name="typeid"value="${roomet.roomNo}" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name"value="${roomet.type}"type="text" class="form-control" required>
                                </div>
                        
                                <div class="form-group">
                                    <label>Bed</label>
                                    <input name="bed"value="${roomet.bed}"type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>MaxOccupancy</label>
                                    <input name="maxoccupancy"value="${roomet.maxOccupancy}"type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price"value="${roomet.price}" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image"value="${roomet.image}"type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Service</label>
                                    <textarea name="service"class="form-control" required>${roomet.service}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Details</label>
                                    <textarea name="details"class="form-control" required>${roomet.details}</textarea>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>

                        </form>
                    </div>
                </div>
            



            <!-- Delete Modal HTML -->

        </a>
        <script src="js/manager.js" type="text/javascript"></script>
</body>

</html>