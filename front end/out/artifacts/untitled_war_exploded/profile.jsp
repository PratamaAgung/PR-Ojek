<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2017
  Time: 16.50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Sanchez" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <meta charset="UTF-8">
    <title>PR-OJEK : My Profile</title>
</head>
<body>
<div class="all-element">
    <div class="head-title">
        <div class="kiri">
            <h2><span class="pr content-font-sanchez">PR</span>-<span class="ojek content-font-sanchez">OJEK</span></h2>
            <p class="subtitle">wushh... wushh... ngeeeeeenggg...</p>
        </div>
        <div class="kanan content-font-roboto">
            <p>Hi, <span class="username-title">Username</span> !</p>
            <a href="login.jsp">Logout</a>
        </div>
    </div>

    <div class="head-title">
        <div class="head-navbar">
            <a class="menu" href="makeorder.jsp?id_active=1">
                <p>ORDER</p>
            </a>
        </div>
        <div class="head-navbar">
            <a class="menu" href="historyorder.jsp?id_active=1">
                <p>HISTORY</p>
            </a>
        </div>
        <div class="head-navbar-now">
            <p>MY PROFILE</p>
        </div>
    </div>

    <div class="head-title">
        <div class="kiri">
            <p class="main-title">MY PROFILE</p>
        </div>
        <div>
            <a href='editprof.jsp?id_active=1\' >
            <img class='edit-button kanan' id='edit-ico' src='img\edit.PNG'>
            </a>
        </div>
    </div>

    <div class="main-content content-font-sanchez">
        <div class='main-content'>
            <div class='gambar-bulat'>
                <img class='user-profpic' src="img\profpic.JPG" >
            </div>
        </div>
        <p><span class='username-profile'>Username</span></p>
        <p>User Complete Name</p>
        <p>Driver/Non-Driver  | <span class='font-rating'>&#9734 5.0</span> (5287  votes)</p>
        <p>username@email.com</p>
        <p>&#9743 089619702049</p>
    </div>

    <div class="head-title">
        <div class="kiri">
            <p class="submain-title">PREFERRED LOCATIONS:</p>
        </div>
        <div>
            <a href="editprefloc.jsp?id_active=1\">
            <img class='edit-button kanan' id='edit-icon' src='img\edit.PNG'>
            </a>
        </div>
    </div>

    <ul class="content-font-sanchez">
        <li>Location</li>
    </ul>
</div>
</body>
</html>
