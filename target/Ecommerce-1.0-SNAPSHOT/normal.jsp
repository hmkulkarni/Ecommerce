<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in. Please login first.");
        response.sendRedirect("login.jsp");
        return;
    } else if (user.getUserType().equals("admin")) {
        session.setAttribute("message", "You are an admin. Please login with regular account to access this page.");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is normal user page</h1>
    </body>
</html>
