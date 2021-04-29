<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in. Please login first to access the checkout page.");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="css/checkout.css">
        <link rel="icon" href="img/shopping-bag.png" type="img/png"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #efefef">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3">
                <!--cart-->
                <div class="col-md-6">
                    <div class="show-cart card">
                        <div class="card-header text-center">
                            <h3>Selected Items</h3>
                        </div>
                        <div class="card-body">
                            <div class="cart-body"></div>
                        </div>
                    </div>
                </div>

                <!--information-->
                <div class="col-md-6">
                    <div class="check-out card">
                        <div class="card-header text-center">
                            <h3>Enter your shipping information</h3>
                        </div>
                        <div class="card-body">
                            <form action="payment.jsp" method="post">
                                <div class="name row">
                                    <div class="form-group col-md-6">
                                        <label class="firstname" for="firstname">First Name</label>
                                        <input value="<%= user.getUserFirstName()%>" id="firstname" type="text" class="form-control" placeholder="Enter your first name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="lastname" for="lastname">Last Name</label>
                                        <input value="<%= user.getUserLastName()%>" id="lastname" type="text" class="form-control" placeholder="Enter your last name" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="mail" for="email">Email address</label>
                                        <input value="<%= user.getUserEmail()%>" id="email" type="text" class="form-control" placeholder="Enter your email ID" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="pass" for="phone">Contact Number</label>
                                        <input value="<%= user.getUserPhone()%>" id="phone" type="text" class="form-control" placeholder="Enter your contact number" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="queries" class="queries">Address</label>
                                        <textarea id="queries" class="form-control" name="message" placeholder="Enter your shipping address" rows="5" required></textarea>
                                    </div>
                                    <div class="buttons container text-center">
                                        <button type="submit" class="btn btn-lg btn-outline-success"">Order Now</button>
                                        <button class="btn btn-lg btn-outline-primary" onclick="returnToHome()">Continue Shopping</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
