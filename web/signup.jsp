<%-- 
    Document   : signup
    Created on : Mar 6, 2023, 1:20:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Designined by CodingLab - youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Responsive Registration Form | CodingLab </title>
    <link rel="stylesheet" href="css/style_1.css">    <!-- Google Font -->
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
        <link rel="stylesheet" href="css/style.css" type="text/css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="container">
      <div class=" " style="text-align: center;font-size: 26px;font-weight: bold;">Registration</div>
    <div class="content">
      <form action="signup" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="name"placeholder="Enter your name" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email"placeholder="Enter your email" required>
          </div>
          <div class="input-box">
            <span class="details">User Name</span>
            <input type="text" name="username"placeholder="Enter your username" required>
            <p class="text-danger">${mess2}</p>
          </div>
           <div class="input-box">
            <span class="details">CMND</span>
            <input type="text" name="cmnd"placeholder="Enter your citizen identification" required>
            
          </div>
            
            <div class="input-box">
            <span class="details">Password</span>
            <input type="text" name="pass"placeholder="Enter your password" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="tel" name="phone"placeholder="Enter your number" required>
          </div>
          
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="text" name="repass"placeholder="Confirm your password" required><!-- comment -->
            <p class="text-danger">${mess1}</p>
            
            
          </div>
            
        </div>
 
        <div class="button">
          <input type="submit" value="Register">
        </div>
      </form>
    </div>
  </div>

</body>
</html>
