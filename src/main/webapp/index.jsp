<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="com.mycompany.ecommerce.entities.User"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.entities.Product"%>
<%@page import="com.mycompany.ecommerce.dao.ProductDao"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MartiFy - Home</title>
        <link rel="icon" href="img/shopping-cart.png" type="img/png"/>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body style="background: #f2f2f2">
        <%@include file="components/navbar.jsp" %>
        <!--        <div class="splash">
                    <h1 class="fade-in">Welcome to MartiFy</h1>
                </div>-->
        <div class="container-fluid">

            <div class="row mt-1">

                <%
                    User user = (User) session.getAttribute("current-user");
                    String cat = request.getParameter("category");

                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null) {
                        list = pdao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = pdao.getProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list2 = cdao.getCategories();
                %>
                <!--Show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-2">
                        <a href="index.jsp" class="list-group-item list-group-item-action">
                            All Products
                        </a>
                        <%
                            for (Category category : list2) {
                        %>
                        <a href="index.jsp?category=<%= category.getCategoryId()%>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle()%></a>
                        <% }%>
                    </div>
                </div>

                <!--Show products-->
                <div class="col-md-10">
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : list) {
                                %>

                                <!--Product Card-->
                                <div class="card text-center product-card">
                                    <img style="max-height: auto; max-width: 40%; " src="img/products/<%= p.getProductImg()%>" class="card-img-top m-2" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getProductTitle()%></h5>
                                        <p class="card-text"><%= Helper.getTenWords(p.getProductDesc())%>
                                            <span class="dots">...</span>
                                            <span class="more"><%= Helper.getRestWords(p.getProductDesc())%></span>
                                            <button class="btn btn-link read-toggle" onclick="toggleReadMore()" id ="read">Read More</button>
                                        </p>
                                    </div>

                                    <div class="card-footer">
                                        <% if (user == null) { %>
                                        <button class="btn custom-bg text-white" onclick="notLoggedIn()">Add to Cart</button>

                                        <% } else {%>
                                        <button class="btn custom-bg text-white" onclick="addToCart(<%= p.getProductId()%>, '<%= p.getProductTitle()%>', <%= p.priceAfterDiscount()%>)">Add to Cart</button>
                                        <% } %>
                                        <% if (p.getProductDiscount() != 0) {%>


                                        <button class="btn btn-outline-success" disabled>&#8377;<%= p.priceAfterDiscount()%>/- <span class="text-secondary original-price">&#8377;<%= p.getProductPrice()%>/- </span><span class="text-secondary discount-label">, <%= p.getProductDiscount()%>% off</span></button>
                                        <%  } else {%>
                                        <button class="btn btn-outline-success" disabled>&#8377;<%= p.getProductPrice()%>/-</button>
                                        <% }%>
                                    </div>
                                </div>
                                <% }
                                    if (list.size() == 0) {
                                        out.println("<h3>No items in this category</h3>");
                                    }
                                %>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
        <script src="js/index.js"></script>
    </body>
</html>
