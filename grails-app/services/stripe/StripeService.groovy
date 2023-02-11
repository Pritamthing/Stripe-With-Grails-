package stripe

import grails.gorm.transactions.Transactional
import com.stripe.Stripe
import com.stripe.model.Price
import com.stripe.model.Product;
import com.stripe.model.checkout.Session
import com.stripe.param.PriceCreateParams
import com.stripe.param.ProductCreateParams;
import com.stripe.param.checkout.SessionCreateParams;

@Transactional
class StripeService {

    def initStripe() {
        Stripe.apiKey = "sk_test_key";
    }

    def getSubscriptionSession(params) {
        if (!params?.name) {
            params.name = "Subscription"
        }
        if (!params?.description) {
            params.description = '$20/Month subscription'
        }
        Product product = createProduct(params)
        System.out.println("Success! Here is your starter subscription product id: " + product.getId());

        Long amount = params?.amount ? Long.parseLong(params?.amount) : 0L

        Price price = createSubscriptionPrice(product, amount)
        Session session = createPaymentSession(SessionCreateParams.Mode.SUBSCRIPTION, price)
        System.out.println("Success! your subscription has been success. " + price.getId());
        return session

    }

    def getPaymentSession(params) {
        if (!params?.name) {
            params.name = "Payment"
        }
        if (!params?.description) {
            params.description = '$20 Payment for using the service'
        }
        Product product = createProduct(params)
        System.out.println("Success! Here is your starter subscription product id: " + product.getId());

        Long amount = params?.amount ? Long.parseLong(params?.amount) : 0L

        Price price = createPaymentPrice(product, amount)
        Session session = createPaymentSession(SessionCreateParams.Mode.PAYMENT, price)
        System.out.println("Success! your subscription has been success. " + price.getId());
        return session
    }

    def createPaymentSession(SessionCreateParams.Mode mode, Price price) {
        String APPLICATION_BASE_URL = "http://localhost:8080";
        SessionCreateParams params =
                SessionCreateParams.builder()
                        .setMode(mode)
                        .setSuccessUrl(APPLICATION_BASE_URL + "/success")
                        .setCancelUrl(APPLICATION_BASE_URL + "/cancel")
                        .addLineItem(
                                SessionCreateParams.LineItem.builder()
                                        .setQuantity(1L)
                                // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
                                        .setPrice(price.id)
                                        .build())
                        .build();
        Session session = Session.create(params);
        return session
    }

    def createProduct(params) {
        ProductCreateParams productParams =
                ProductCreateParams.builder()
                        .setName(params?.name)
                        .setDescription(params?.description)
                        .build();
        Product product = Product.create(productParams);
        return product
    }

    def createSubscriptionPrice(product, amount) {
        PriceCreateParams params =
                PriceCreateParams
                        .builder()
                        .setProduct(product.getId())
                        .setCurrency("usd")
                        .setUnitAmount(amount * 100L)
                        .setRecurring(
                                PriceCreateParams.Recurring
                                        .builder()
                                        .setInterval(PriceCreateParams.Recurring.Interval.MONTH)
                                        .build())
                        .build();
        Price price = Price.create(params);
        return price
    }

    def createPaymentPrice(product, amount) {
        PriceCreateParams params =
                PriceCreateParams
                        .builder()
                        .setProduct(product.getId())
                        .setCurrency("usd")
                        .setUnitAmount(amount * 100L)
                        .build();
        Price price = Price.create(params);
        return price
    }
}
