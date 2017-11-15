<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2017
  Time: 17.38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PR-OJEK : Edit Preferred Location</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/edit.css" rel="stylesheet">
</head>
<body>
<div class="all-element">
    <div class="head-title ">
        <p class="judul">Edit Preferred Locations</p>
    </div>

    <div class="head-title">
        <table>

        </table>
    </div>

    <div class="head-title">
        <table>
            <tr>
                <th class="nomor content-font-roboto">No</th>
                <th class="lokasi content-font-roboto">Locations</th>
                <th class="aksi content-font-roboto">Actions</th>
            </tr>
            <tr>
                <td class='nomor content-font-sanchez'>1</td>
                <td class='lokasi'>
                    <input id='loc' class='list-lokasi content-font-sanchez' type='text' value='location' disabled='disabled'>
                </td>
                <td class='aksi'>
                    <div class='head-title no-margin' style='margin-bottom: 10px'>
                        <span id='edit1' class='gambar-icon gambar-icon-edit' onclick='editLocation()'>&#10000;</span>
                        <span id='delete1' class='gambar-icon gambar-icon-delete' onclick='deleteLocation()'>&#10006;</span>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <div class="head-title top-margin">
        <div class="subjudul">ADD NEW LOCATION:</div>
    </div>

    <div class="head-title">
        <input type="text" id="location" class="field-location" name="newlocation">
        <button class="green-button posisi-kanan content-font-sanchez" onclick="addLocation()">ADD</button>
    </div>

    <div class="head-title top-margin">
        <a href="profile.jsp?id_active=1" >
            <button class="red-button posisi-kiri content-font-sanchez">BACK</button>
        </a>
    </div>


</div>
</body>
</html>
