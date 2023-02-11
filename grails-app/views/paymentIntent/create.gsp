<%--
  Created by IntelliJ IDEA.
  User: Pritam Thing
  Date: 2/11/2023
  Time: 7:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<asset:stylesheet src="main.css"/>
<asset:stylesheet src="bootstrap.min1.css"/>
<asset:stylesheet src="all-min.css"/>
<asset:stylesheet src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<asset:javascript src="payment.js"/>
<!DOCTYPE html>
<html>
<head>
    <title>Buy cool new product</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://js.stripe.com/v3/"></script>
</head>

<body>
<section class="pricing py-5">
    <div class="container">
        <div class="row">
            <!-- Free Tier -->
            <div class="col-lg-4">
                <div class="card mb-5 mb-lg-0">
                    <div class="card-body">
                        <form action="/create-checkout-subscription" method="POST">
                            <input type="hidden" name="name" , value="Free Subscription Test">
                            <input type="hidden" name="amount" , value="0">
                            <input type="hidden" name="description" , value="Free Subscription Test Description">
                            <h5 class="card-title text-muted text-uppercase text-center">Free</h5>
                            <h6 class="card-price text-center">$0<span class="period">/month</span></h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Single User</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>5GB Storage</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
                                <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Unlimited
                                Private Projects</li>
                                <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Dedicated
                                Phone Support</li>
                                <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i>
                                </span>Free Subdomain
                                </li>
                                <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i>
                                </span>Monthly Status
                                Reports</li>
                            </ul>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary text-uppercase">Subscription</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- Plus Tier -->
            <div class="col-lg-4">
                <div class="card mb-5 mb-lg-0">
                    <div class="card-body">
                        <form action="/create-checkout-subscription" method="POST">
                            <input type="hidden" name="name" , value="Plus Subscription Test">
                            <input type="hidden" name="amount" , value="9">
                            <input type="hidden" name="description" , value="Plus Subscription Test Description">
                            <h5 class="card-title text-muted text-uppercase text-center">Plus</h5>
                            <h6 class="card-price text-center">$9<span class="period">/month</span></h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>5 Users</strong></li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>50GB Storage</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone Support</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Free Subdomain</li>
                                <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i>
                                </span>Monthly Status
                                Reports</li>
                            </ul>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary text-uppercase">Subscription</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- Pro Tier -->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <form action="/create-checkout-subscription" method="POST">
                            <input type="hidden" name="name" , value="Pro Subscription Test">
                            <input type="hidden" name="description" , value="Pro Subscription Test Description">
                            <input type="hidden" name="amount" , value="49">
                            <h5 class="card-title text-muted text-uppercase text-center">Pro</h5>
                            <h6 class="card-price text-center">$49<span class="period">/month</span></h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fas fa-check"></i>
                                </span><strong>Unlimited Users</strong>
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>150GB Storage</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone Support</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i>
                                </span><strong>Unlimited</strong> Free
                                Subdomains</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Monthly Status Reports</li>
                            </ul>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary text-uppercase">Subscription</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<hr>
%{--payment section--}%
<section class="pricing py-5">
    <div class="container">
        <div class="row">
            <!-- One time Payment -->
            <div class="col-lg-4">
                <div class="card mb-5 mb-lg-0">
                    <div class="card-body">
                        <form action="/create-checkout-payment" method="POST">
                            <input type="hidden" name="name" , value="Payment Test">
                            <input type="hidden" name="description" , value="Payment test Description">
                            <input type="hidden" name="amount" , value="500">
                            <h5 class="card-title text-muted text-uppercase text-center">One time</h5>
                            <h6 class="card-price text-center">$500<span class="period">/year</span></h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fas fa-check"></i>
                                </span><strong>Unlimited Users</strong>
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>150GB Storage</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Private Projects
                                </li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Dedicated Phone Support</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i>
                                </span><strong>Unlimited</strong> Free
                                Subdomains</li>
                                <li><span class="fa-li"><i class="fas fa-check"></i></span>Monthly Status Reports</li>
                            </ul>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary text-uppercase">Payment</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>