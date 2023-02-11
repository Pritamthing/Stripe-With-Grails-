package stripe

import com.stripe.model.checkout.Session
class PaymentIntentController {

   def stripeService

    def index() {
        redirect(action:"create")
    }

    def create() {}

    def subscription() {
        stripeService.initStripe()
        Session session = stripeService.getSubscriptionSession(params)
        redirect(url: session.getUrl());
    }

    def payment() {
        stripeService.initStripe()
        Session session = stripeService.getPaymentSession(params)
        redirect(url: session.getUrl());
    }


}