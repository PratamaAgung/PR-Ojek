<%@ page import="ws.UserManager" %>
<%@ page import="ws.DriverManager" %>
<%@ page import="org.json.JSONObject" %><%--
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
            <p>Hi, <span class="username-title"><%= request.getParameter("username") %></span> !</p>
            <a onclick="logout('<%= request.getParameter("token") %>')">Logout</a>
        </div>
    </div>

    <div class="head-title">
        <div class="head-navbar-now">
            <p>ORDER</p>
        </div>
        <div class="head-navbar">
            <a class="menu" href="historyorder.jsp?token=<%= request.getParameter("token") %>&username=<%= request.getParameter("username") %>">
                <p>HISTORY</p>
            </a>
        </div>
        <div class="head-navbar">
            <a class="menu" href="profile.jsp?token=<%= request.getParameter("token") %>&username=<%= request.getParameter("username") %>">
                <p>MY PROFILE</p>
            </a>
        </div>
    </div>

    <div class="head-title">
        <div class="kiri">
            <p class="main-title">MAKE AN ORDER</p>
        </div>
    </div>

    <div class="head-title use-baseline content-font-sanchez">
        <div id="label-step-1" class="order-step-now">
            <p class="step-number">1</p>
            <p class="step-def">Select Destination</p>
        </div>
        <div id="label-step-2" class="order-step">
            <p class="step-number">2</p>
            <p class="step-def">Select a Driver</p>
        </div>
        <div id="label-step-3" class="order-step">
            <p class="step-number">3</p>
            <p class="step-def">Complete your order</p>
        </div>
    </div>

    <%-- FORM PART 1 --%>
    <div id="step-1">
        <div class="head-title content-font-roboto" >
            <div class="input-label">Picking point</div>
            <input id="pick-location" name="pick-location" class="input-place" type="text" >
        </div>

        <div class="head-title content-font-roboto" >
            <div class="input-label">Destination</div>
            <input id="destination" name="destination" class="input-place" type="text" >
        </div>

        <div class="head-title content-font-roboto" >
            <div class="input-label">Preferred Driver</div>
            <input id="input-prefer-driver" class="input-place" type="text" placeholder="(optional)">
        </div>

        <div class="head-title main-content content-font-sanchez" >
            <div class="green-button posisi-tengah" onclick="increase(); setPreferDriver(document.getElementById('input-prefer-driver').value,'<%= request.getParameter("username") %>',document.getElementById('destination').value,document.getElementById('pick-location').value );
                    setOtherDriver(document.getElementById('input-prefer-driver').value,'<%= request.getParameter("username") %>',document.getElementById('destination').value,document.getElementById('pick-location').value );">
                Next
            </div>
        </div>
    </div>

    <%-- FORM PART 2 --%>
    <div id="step-2">
        <div class="column-flex with-border">
            <p class="submain-title">PREFERRED DRIVERS:</p>
            <div id="preffered-driver"></div>
        </div>

        <div class="column-flex with-border">
            <p class="submain-title">OTHER DRIVERS:</p>
            <div id="other-driver"></div>
            <%
                UserManager userManager = new UserManager();
                DriverManager driverManager = new DriverManager();
                String search = "agung";
                String destination = "asu";
                String tmp = userManager.getPreferred(search);
                String lain = userManager.getOtherDriver(search, destination);
                Integer num_row = 0;
                JSONObject hehe = new JSONObject();
                JSONObject json = new JSONObject();
                try {
                    hehe = new JSONObject(tmp);
                    json = new JSONObject(lain);
                    num_row = json.length();
                } catch (Exception e) {
                    num_row = 0;
                }

                String other_driver = "";
                if (num_row >= 1) {
                    Integer i = 0;
                    String driver;
                    while (i < num_row){
                        try {
                            other_driver = other_driver +
                                    "<div class='head-title driver-list' id='" + json.getJSONObject(i.toString()).getString("username") + "'> " +
                                    " < div class='gambar-kotak' > " +
                                    " <img class='square-picture' src = '" + json.getJSONObject(i.toString()).getString("image_address") + "' " +
                                    " alt = '" + json.getJSONObject(i.toString()).getString("username") + "' > " +
                                    " </div > " +
                                    " <div class='detail-select-driver content-font-sanchez' > " +
                                    " <p > " + json.getJSONObject(i.toString()).getString("name") + " </p > " +
                                    " <p ><span class='font-rating' > &#9734 " + driverManager.getCurrentRate(json.getString("username")) + " </ " +
                                    "span > (" + driverManager.getVotes(json.getString("username")) + " votes)</p > " +
                                    " <div class='green-button posisi-bawah posisi-kanan' " +
                                    " onclick = 'increase(); iChoose(" + json.getJSONObject(i.toString()).getString("username") + ");' > I Choose You ! </div > " +
                                    " </div > " +
                                    " </div > ";
                        } catch (Exception e){
                            out.print("Nothing to display");
                        }
                        ++i;
                    }
                    if (other_driver == ""){
                        out.print("Nothing to display");
                    } else {
                        out.print(other_driver);
                    }
                } else {
                    out.print("Nothing to display");
                }
            %>
        </div>
    </div>
    <input name="driver-id" id="driver-id" type="text" style="display:none" >

    <%--<!--            </form>-->--%>

    <%--<!--            <form method="post" action="makeorder.php?id_active=--><?php //echo $id_active; ?><!--">-->--%>
    <div id="step-3">
        <div class="head-title">
            <div class="kiri">
                <p class="submain-title">HOW WAS IT:</p>
            </div>
        </div>

        <div id="info-selected-driver" class="main-content content-font-sanchez">
            <div class="main-content">
                <div class="gambar-bulat">
                    <img class="user-profpic" src="img/profpic.JG" alt="asd" ></img>
                </div>
            </div>
            <p><span class="username-profile">@username</span></p>
            <p>user full name</p>
            <fieldset class="rating" id="rate">
                <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
            </fieldset>
        </div>

        <div class="head-title">
            <textarea id="comment" name="comment" class="input-comment" placeholder="Your comment..."></textarea>
        </div>
        <!-- Kurang your comment di text area -->
        <div class="head-title content-font-sanchez">
            <button class="green-button posisi-kanan content-font-sanchez" onclick="order('<%= request.getParameter("username")%>')">Complete <br> Order</button>
        </div>
    </div>
    <!--            </form>-->
</div>

<script src="js/makeorder.js"></script>
<script type="text/javascript" src="js/logout.js"></script>
</body>
</html>

