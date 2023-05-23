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
        </header>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>List <b>All Room</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Room</span></a>
                            <a href="#addNewRoomType"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Room Types</span></a>
                            
                            <a href="#editroomtype" class="btn btn-danger" data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>Edit Room Types</span></a>
<!--                                                       <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						-->
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>TypeID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Service</th>
                            <th>RoomNo</th>
                            <th>View</th>
                            <th>Avaibility</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="room" items="${listRoom}">
                            <c:if test="${room.roomNo != 0}">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${room.typeId}</td>
                                    <td>${room.name}</td>
                                    <td>
                                        <img src="${room.image}">
                                    </td>
                                    <td>${room.price} </td>
                                    <td>${room.service} </td>
                                    <td>${room.roomNo} </td>
                                    <td>${room.type} </td>
                                    <c:if test="${room.availability != 'Valid'}">
                                        <td class="text-danger">${room.availability} </td>
                                    </c:if>
                                    <c:if test="${room.availability != 'InValid'}">
                                        <td class="text-success">${room.availability} </td>
                                    </c:if>



                                    <td>
                                        <a href="loadroom?roomedit=${room.roomNo}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="delete?roomdel=${room.roomNo}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        <!--                                    <a href="Detail.jsp" class="delete" ><i class="material-icons" data-toggle="tooltip" title="Details">&#8756;</i></a>-->
                                    </td>
                                </tr>
                            </c:if>



                        </c:forEach>

                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button> </a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addroom" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Room</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                               <div class="form-group">
                                <label>Room Types</label>
                                <select name="typeidd" class="form-select" aria-label="Default select example">
                                    <c:forEach var="rt" items="${listRT}">
                                        <option value="${rt.typeId}">${rt.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                View
                                <input name="type" type="text" class="form-control" required>
                            </div>
                            

                         

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
                <div id="addNewRoomType" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addroomtype" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Room Types</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                               <div class="form-group">
                                <label>Type Name</label>
                                <input name="name" type="text" class="form-control" required>
                               </div>
                             <div class="form-group">
                                <label>Beds</label>
                                <input name="bed" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>NumberRoom</label>
                                <input name="numberroom" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>MaxOccupancy</label>
                                <input name="max" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Service</label>
                                <input name="service" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Details</label>
                                <input name="details" type="text" class="form-control" required>
                            </div>
                            
                            

                         

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
                        <div id="editroomtype" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    
                    <form action="editroomtype" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Room Types</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <select name="typeidd" class="form-select" aria-label="Default select example">
                                    <c:forEach var="rt" items="${listRT}">
                                        <option value="${rt.typeId}">${rt.name}</option>
                                    </c:forEach>
                                </select>
                               <div class="form-group">
                                <label>Type Name </label>
                                <input name="name" type="text" class="form-control" required>
                               </div>
                             <div class="form-group">
                                <label>Beds</label>
                                <input name="bed" type="text" class="form-control" required>
                            </div>
                           
                             <div class="form-group">
                                <label>MaxOccupancy</label>
                                <input name="max" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Service</label>
                                <input name="service" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Details</label>
                                <input name="details" type="text" class="form-control" required>
                            </div>
                            
                            

                         

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
        <div id="editEmployeeModal" class="modal fade">
         <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editroom?roomedit=$${roomedit.roomNo}" method="post">

                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Room</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            
                                <div class="form-group">
                                    <label>Room No</label>
                                    <input value="${roomedit.roomNo}" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>View</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Bed</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>MaxOccupancy</label>
                                    <input type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Service</label>
                                    <textarea class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Details</label>
                                    <textarea class="form-control" required></textarea>
                                </div>
                            
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>

                    </form>
                </div>
            </div>
        </div>

        
       
                             
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </a>
    <script src="js/manager.js" type="text/javascript"></script>
</body>

</html>