<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="icon" href="img/lock.png" type="img/png"/>
        <link rel="stylesheet" href="css/login.css">

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #efefef">
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header custom-bg text-white">
                            <h3>Login Page</h3>
                        </div>

                        <div class="card-body">
                            <%@include file="components/messageLogin.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label class="mail" for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" required="true" placeholder="Enter your email">

                                </div>
                                <div class="form-group">
                                    <label class="pass" for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" required="true" id="exampleInputPassword1" placeholder="Enter your password">
                                </div>
                                <a href="register.jsp" class="d-block text-center mb-3">New to the website? Click here to register</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg">Login</button>
                                    <button type="reset" class="btn btn-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
