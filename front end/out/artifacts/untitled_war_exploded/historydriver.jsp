<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2017
  Time: 18.25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Sanchez" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <meta charset="UTF-8">
    <title>PR-OJEK : History Order</title>
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
        <div class="head-navbar-now">
            <p>HISTORY</p>
        </div>
        <div class="head-navbar">
            <a class="menu" href="profile.jsp?id_active=1">
                <p>MY PROFILE</p>
            </a>
        </div>
    </div>

    <div class="head-title">
        <div class="kiri">
            <p class="main-title">TRANSACTION HISTORY</p>
        </div>
    </div>

    <div class="head-title">
        <div class="history-type">
            <a class="menu" href="historyorder.jsp?id_active=1">MY PREVIOUS ORDER</a>
        </div>
        <div class="history-type-now">
            DRIVER ORDER
        </div>
    </div>

    <div class="column-flex">
        <div id='id_order' class='head-title driver-list'>
            <div class='gambar-kotak'>
                <img class='square-picture' src='img/profpic.JPG' alt='pikachu'>
            </div>
            <div class='detail-select-driver column-flex content-font-sanchez no-margin'>
                <p class='history-date'>Day, Month Tgl Tahun</p>
                <p class='history-name'>Name</p>
                <p class='history-place'>Pick Location -> Destination Location</p>
                <p class='history-rate'>gave <span class='font-rating'>rating_number</span> stars for this order </p>
                <p class='history-comment'>and left comment: </p>
                <p class='history-comment-value'>comment<p>
                <button class='red-button posisi-atas posisi-kanan content-font-sanchez'
                        onclick='hideHistory()'>HIDE</button>
            </div>
        </div>

    </div>

</div>
</body>
</html>
