<%@ page import="ws.UserManager" %><%--
  Created by IntelliJ IDEA.
  User: pratamaagung
  Date: 08/11/17
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String full_name = request.getParameter("name");
    String phone_number = request.getParameter("phone");
    String token = request.getParameter("token");
    String driver = request.getParameter("driver_status");

//    out.print(username + full_name + phone_number + token + driver);
    UserManager userManager = new UserManager();
    Boolean bool_name = userManager.setName(username,full_name);
    Boolean bool_phone_number = userManager.setPhone(username,phone_number);
    if(driver == null){
        driver = "0";
    } else {
        driver = "1";
    }
    Boolean bool_driver = userManager.setDriver(username, Integer.parseInt(driver));
    out.print(bool_name.toString() + bool_phone_number.toString() + bool_driver.toString());
    if(bool_driver && bool_name && bool_phone_number){
        response.sendRedirect("../profile.jsp?token=" + token + "&username=" + username);
    } else {
        response.sendRedirect("../editprof.jsp?token=" + token + "&username=" + username);
    }
%>