<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in. Please login first.");
        response.sendRedirect("login.jsp");
        return;
    } else if (user.getUserType().equals("normal")) {
        session.setAttribute("message", "You are not admin. Please login with admin account to access this page.");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%  CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = catDao.getCategories();

    // Getting the counts for user and products dynamically
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="icon" href="img/admin.png" type="img/png"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #f2f2f2">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid admin">
            <div class="row mt-3">
                <div class="container-fluid">
                    <%@include file="components/messageAdmin.jsp" %>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="tooltip" data-placement="top" title="This shows the number of users on the website">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="tooltip" data-placement="top" title="This shows the number of categories present">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/reminders.png" alt="category_icon">
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="tooltip" data-placement="top" title="This shows the number of products present">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/packaging.png" alt="product_icon">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center" data-toggle="tooltip" data-placement="bottom" title="Click this to add a new category">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="add_category">
                            </div>
                            <h1 class="mt-3 text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center" data-toggle="tooltip" data-placement="bottom" title="Click this to add a new product">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="add_product">
                            </div>
                            <h1 class=" mt-3 text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Add Category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="categoryLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="categoryLabel">Fill Category Details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory">
                            <div class="form-group">
                                <input name="catTitle" type="text" class="form-control" placeholder="Enter the category title" required="true">
                            </div>
                            <div class="form-group">
                                <textarea style="height: 125px" name="catDescription" type="text" class="form-control" placeholder="Enter the category description" required="true"></textarea>
                            </div>
                            <div class="container text-center mt-2">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button class="btn btn-outline-warning" type="reset">Reset</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End Category modal-->

        <!--Add Product modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="productLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="productLabel">Fill Product Details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addProduct">
                            <div class="form-group">
                                <input name="prodTitle" type="text" class="form-control" placeholder="Enter the product name" required="true">
                            </div>
                            <div class="form-group">
                                <input name="prodPrice" type="number" class="form-control" placeholder="Enter the product price" required="true">
                            </div>
                            <div class="form-group">
                                <input name="prodDiscount" type="number" class="form-control" placeholder="Enter the product discount">
                            </div>
                            <div class="form-group">
                                <input name="prodQuantity" type="number" class="form-control" placeholder="Enter the product quantity" required="true">
                            </div>



                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <option value="" disabled selected>Select your option</option>
                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pic">Upload Image</label>
                                <input class="form-control" id="pic" type="file" name="prodImg" required="true">
                            </div>
                            <div class="form-group">
                                <textarea style="height: 125px" name="prodDescription" type="text" class="form-control" placeholder="Enter the product description"></textarea>
                            </div>
                            <div class="container text-center mt-2">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button class="btn btn-outline-warning" type="reset">Reset</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End Product modal-->
        <%@include file="components/common_modals.jsp" %>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
