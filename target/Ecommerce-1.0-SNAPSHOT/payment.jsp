<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Gateway</title>
        <link rel="icon" href="img/secure-payment.png" type="img/png"/>
    </head>
    <%@include file="components/common_css_js.jsp" %>
    <body>
        <form action="" method="POST">

            <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_live_RC459Qphay7RWF" 
                data-amount="100" 
                data-currency="INR"
                data-id="123"
                data-name="Payment Sction"
                data-description="MartiFy"
                data-image="https://img.freepik.com/free-vector/wallet-money-cartoon_138676-2086.jpg?size=338&ext=jpg&ga=GA1.2.511897683.1608972192"
                data-theme.color="#3f51b5"
            ></script>
            <input type="hidden" name="hidden">
        </form>
    </body>
</html>
