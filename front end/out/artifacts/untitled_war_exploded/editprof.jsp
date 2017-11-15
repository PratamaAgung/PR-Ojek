<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2017
  Time: 17.23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PR-OJEK : Edit Preferred Location</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/edit.css" rel="stylesheet">\
</head>
<body>
<div class="all-element">
    <div class="head-title">
        <p class="judul">Edit Profile Information</p>
    </div>

    <form method="post" action="editprof.jsp?id_active=1>" enctype="multipart/form-data">
        <div class="head-title ">
            <div class="gambar-kotak">
                <img id="img-profile" class="square-picture">
            </div>

            <div class="column-flex fit-width">
                <div class="head-title content-font-sanchez">
                    Update Profile Picture
                </div>
                <div class="head-title no-margin">
                    <input id="file-path" class="file-gambar" type="text" value="" disabled="disabled">
                    <label for="file-upload" class="custom-file-upload posisi-kanan">
                        <input id="file-upload" type="file" name="img-file-addr" onchange="cek()">
                        Browse...
                    </label>
                </div>
            </div>


        </div>

        <div class="head-title content-font-roboto">
            <div class="field-label"> Your Name </div>
            <input id="name" type="text" class="field-value" name="name">
        </div>

        <div class="head-title content-font-roboto">
            <div class="field-label"> Phone</div>
            <input id="phone" type="text" class="field-value" name="phone">
        </div>

        <div class="head-title content-font-roboto">
            <div class="field-label">Status Driver</div>
            <label class="switch posisi-kanan">
                <input id="statusDriver" type="checkbox" name="driver_status" onchange="stats()">
                <span class="slider round"></span>
            </label>
        </div>

        <div class="head-title top-margin content-font-sanchez">
            <input id="editprof-submit" class="green-button posisi-kanan content-font-sanchez"
                   type="submit" name="save" value="SAVE">
        </div>
    </form>
    <div class="head-title top-margin content-font-sanchez">
        <a href='profile.jsp?id_active=1'>
        <button class="red-button posisi-kiri content-font-sanchez">BACK</button>
        </a>
    </div>
</div>
</body>
</html>