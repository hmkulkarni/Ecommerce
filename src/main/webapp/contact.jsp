<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="stylesheet" href="css/contact.css">
        <link rel="icon" href="img/contact.png" type="img/png"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #efefef">
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_modals.jsp" %>
        <div class="container-fluid">
            <div class="row mt-4 mr-2 ml-2">

                <div class="col-md-6 offset-md-3">
                    <div class="contact-us card">
                        <div class="card-header text-center custom-bg text-white">
                            <h3>We are here at your service!!</h3>
                        </div>
                        <div class="card-body">
                            <form action="MailServlet" method="post">
                                <div class="name row">
                                    <div class="form-group col-md-6">
                                        <label class="firstname" for="firstname">First Name</label>
                                        <input name="firstName" id="firstname" type="text" class="form-control" placeholder="Enter your first name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="lastname" for="lastname">Last Name</label>
                                        <input name="lastName" id="lastname" type="text" class="form-control" placeholder="Enter your last name" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="mail" for="email">Email address</label>
                                        <input name="emailAdd" id="email" type="text" class="form-control" placeholder="Enter your email ID" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="pass" for="phone">Contact Number</label>
                                        <input name="contactNo" id="phone" type="text" class="form-control" placeholder="Enter your contact number" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="queries" class="queries">Queries/ Suggestions</label>
                                        <textarea name="queryBox" id="queries" class="form-control" name="message" placeholder="Enter your queries or suggestions here" rows="5" required></textarea>
                                    </div>
                                    <div class="buttons container text-center">
                                        <button type="submit" class="btn btn-lg btn-success">Send</button>
                                        <button class="btn btn-lg btn-warning" type="reset">Reset</button>
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
