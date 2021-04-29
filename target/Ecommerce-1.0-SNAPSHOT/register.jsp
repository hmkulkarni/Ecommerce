<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="icon" href="img/lock.png" type="img/png"/>
        <link rel="stylesheet" href="css/register.css">


        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #efefef">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3 mb-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Registration Page</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/messageRegister.jsp" %>
                            <form action="RegisterServlet" method="post">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="fname" for="fname">First Name</label>
                                        <input name="user_first_name" type="name" class="form-control" id="fname" required="true" placeholder="Enter your first name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="lname" for="lname">Last Name</label>
                                        <input name="user_last_name" type="name" class="form-control" id="lname" required="true" placeholder="Enter your last name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="mail" for="email">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="email" required="true" placeholder="Enter your email">
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="pass" for="password">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="password" required="true" placeholder="Enter your password">

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="repass" for="repassword">Confirm Password</label>
                                        <input name="user_re_password" type="password" class="form-control" id="repassword" required="true" placeholder="Confirm your password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="contact" for="phone">Contact Number</label>
                                    <input name="user_phone" type="text" class="form-control" id="phone" required="true" placeholder="Enter your contact number">
                                </div>
                                <div class="form-group">
                                    <label class="addr" for="address">Address</label>
                                    <textarea name="user_address" style="height:85px;" class="form-control" required="true" placeholder="Enter your address"></textarea>
                                </div>
                                <a href="login.jsp" class="d-block text-center mb-3">Already registered? Click here to login</a>
                                <div class="container text-center">
                                    <button onclick="return submitForm();" id="btnSubmit" class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-primary" type="reset">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="js/register.js"></script>
</html>
