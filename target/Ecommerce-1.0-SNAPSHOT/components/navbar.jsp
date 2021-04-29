<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
%>
<%@include file="common_css_js.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&family=Amaranth&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <a href="index.jsp"><img style="max-height: 50px; padding-left: 20px; padding-right: 20px; width: auto" class="img-responsive2" src="img/mart.png" alt="martify"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active" style="padding-right: 40px">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active" style="padding-right: 40px">
                <a class="nav-link" href="about.jsp">About</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fab fa-opencart" style="font-size: 25px"></i><span class="ml-1 cart-items" style="font-size: 20px">(0)</span></a>
            </li>
            <%
                if (user1 == null) {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp">Register</a>
            </li>
            <%
            } else {
            %>
            <li class="nav-item active">
                <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp"%>"><%= user1.getUserFirstName() + " " + user1.getUserLastName()%></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">
                    <button class="btn btn-sm btn-light">Logout</button>
                </a>
            </li>
            <% }%>

        </ul>
    </div>
</nav>