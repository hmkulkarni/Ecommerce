<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MartiFy - About</title>
        <link rel="icon" href="img/personal-data.png" type="img/png"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #efefef">
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid mt-3">
            <h1 class="text-center mr-3 ml-3">Welcome to MartiFy - Your One Stop Shop for everything ranging from breakfast cereal to MacBooks</h1>
            <br><br>
            <h3 class="text-center mr-5 ml-5">
                You will find great deals at low prices without having to leave your couch.
                Moreover, we at MartiFy consider customer satisfaction as our topmost priority and we promise you a hassle-free experience.
                Have any queries/suggestions?
            </h3>
            <br><br>
            <h4 class="text-center">Contact us <a href="contact.jsp">here</a></h4>
            <br><br>
            <div class="row">
                <div class="col-md-6">

                    <div class="row ml-4">
                        <div class="form-group col-md-12">
                            <span class="fa fa-map-marker-alt"></span>&nbsp;&nbsp;Andheri, Mumbai, Maharashtra, India<br>
                        </div>
                    </div>
                    <div class="row ml-4">
                        <div class="form-group col-md-12">
                            <span class="fa fa-envelope"></span>&nbsp;&nbsp;hmkulkarni2001@gmail.com<br>
                        </div>
                    </div>
                    <div class="row  ml-4">
                        <div class="form-group col-md-12">
                            <span class="fa fa-phone"></span>&nbsp;&nbsp;+91 97670 17642<br>
                        </div>
                    </div>
                    <div class="row ml-4">
                        <div class="form-group col-md-12">
                            <span class="fa fa-clock"></span>&nbsp;&nbsp;Monday - Friday 8:00 AM to 5.00 PM
                        </div>
                    </div>
                </div>
                <div class="lst col-md-6">
                    <h6 style="padding-left: 4">Project made by:</h6>
                    <ul>
                        <li>Hrishikesh Kulkarni</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
    <%@include file="components/common_modals.jsp" %>
</html>
