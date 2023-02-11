package stripe

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(action: "index", controller: "paymentIntent")
        "/create-checkout-subscription"(action: "subscription", controller: "paymentIntent")
        "/create-checkout-payment"(action: "payment", controller: "paymentIntent")
        "/success"(view:'/paymentIntent/success')
        "/cancel"(view:'/paymentIntent/cancel')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
