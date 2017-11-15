<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2017
  Time: 16.29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Sanchez" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="css/style1.css" rel="stylesheet">
    <title>Sign up</title>
    <!-- <link href="reset.css" rel="stylesheet"> -->
    <meta charset="utf-8">
</head>

<body>
<div class="front_page">
    <div class="header">
        <!--        <div class="horizontal-line-top"></div>-->
        <!--        <div class="horizontal-line-bottom"></div>-->
        <!--        <h2>_____</h2>-->
        <!--        <div class="header-title">SIGNUP</div>-->
        <!--        <h2>_____</h2>-->
        <!--        <div class="horizontal-line-top"></div>-->
        <!--        <div class="horizontal-line-bottom"></div>-->


        <h2>_____</h2>
        <div class="header-title">SIGNUP</div>
        <h2>_____</h2>
    </div>
    <div class="content">
        <form method="post" action="signup.php">
            <div class="form-group">
                <label class="signup-txt-top">Your Name</label>
                <input class="signup-input" id="full_name" type="text" name="full_name" oninput="checkName(this.value)">
            </div>
            <div id="error-name" class="error">
                <span>*Nama max 20 karakter</span>
            </div>
            <div class="form-group">
                <label class="signup-txt" >Username</label>
                <input class="signup-input-2" id="username" type="text" name="user_name" oninput="checkUsername(this.value)" >
                <span id="checkUsername" class="check"></span>
                <br>
            </div>
            <div class="form-group">
                <label class="signup-txt">Email</label>
                <input class="signup-input-2" id="user_email" type="text" name="email" oninput="checkEmail(this.value)">
                <span id="checkEmail" class="check"></span>
                <br>
            </div>
            <div id="error-email" class="error">
                <span>*Format email tidak sesuai</span>
            </div>
            <div class="form-group">
                <label class="signup-txt">Password</label>
                <input class="signup-input" type="password" id="user-password" name="user_password" >
            </div>
            <div class="form-group">
                <label class="signup-txt">Confirm Password</label>
                <input class="signup-input" type="password" name="confirm_user_password" oninput="checkPassword(this.value)" >
            </div>
            <div id="error-password" class="error">
                <span>*Password tidak cocok</span>
            </div>
            <div class="form-group">
                <label class="signup-txt">Phone Number</label>
                <input class="signup-input" type="text" id="user-phone-number" name="user_telephone" oninput="checkPhoneNumber(this.value)">
            </div>
            <div id="error-phone-number" class="error">
                <span>*Phone number 9-14 karakter</span>
            </div>
            <div class="form-group checkbox">
                <input type="checkbox" id="driverstatus" name="driver_auth" onchange="cek1()">
                <span class="desc-checkbox">Also sign me up as a driver!</span>
            </div>
            <a id="signup-link" href="login.jsp"> Already have an account ? </a>
        </form>
        <input class="content-font-sanchez" id="signup-submit" type="submit" name="register" onclick="submitSignUp()" value="REGISTER">
    </div>
</div>
</body>
</html>
