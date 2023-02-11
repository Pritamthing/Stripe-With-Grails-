<%--
  Created by IntelliJ IDEA.
  User: Pritam Thing
  Date: 2/11/2023
  Time: 7:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buy cool new product</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
<section>
    <div class="product">
        <img src="https://i.imgur.com/EHyR2nP.png" alt="The cover of Stubborn Attachments" />
        <div class="description">
            <h3>Stubborn Attachments</h3>
            <h5>$20.00</h5>
        </div>
    </div>
    <form action="/create-checkout-subscription" method="POST">
        <button type="submit" id="checkout-button_subscription">Subscription</button>
    </form>
    <form action="/create-checkout-payment" method="POST">
        <button type="submit" id="checkout-button_payment">Payment</button>
    </form>
</section>
</body>
</html>