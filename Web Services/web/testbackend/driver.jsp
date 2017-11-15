<%@ page import="ws.DriverManager" %>
<%@ page import="ws.UserManager" %>
<%@ page import="org.json.JSONObject" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 08/11/2017
  Time: 20.30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String setPreferDriver(String search, String username, String destination, String pick) {
        UserManager userManager = new UserManager();
        DriverManager driverManager = new DriverManager();
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
                    return "Nothing to display";
                }
                ++i;
            }
            if (other_driver == ""){
                return "Nothing to display";
            } else {
                return other_driver;
            }
        } else {
            return "Nothing to display";
        }
    }
%>

<%
    UserManager um = new UserManager();
    try {
        out.print("12312312312312312");
        if (request.getParameter("search").length() > 0) {
            String search = request.getParameter("search");
            String username = request.getParameter("username");
            String destination = request.getParameter("destination");
            String pick = request.getParameter("pick");
            out.print(setPreferDriver(search, username, destination, pick));
        }
    } catch (Exception e) {
        out.print("Nothing to show");
    }
    try {
        if (request.getParameter("cari").length() > 0){

        }
    } catch (Exception e) {
        out.print("Nothing to show");
    }
%>