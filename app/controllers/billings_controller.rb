class BillingsController < ApplicationController
    def pre_pay
        payment = PayPal::SDK::REST::Payment.new({})
            intent: "sale",
            payer: {
             payment_method: "paypal" },
redirect_urls: {
    return_url: "http://localhost:3000/billings/execute",
    cancel_url: "http://localhost:3000/" },
transactions: [{
    item_list: {
        items: items
        },
amount: {
    total: total.to_s,
    currency: "USD" },
description: "Compra desde E-commerce Rails." }]
})
    end
        if payment.create            
            redirect_url = payment.links.find{|v| v.method == "REDIRECT"
        }.href
            redirect_to redirect_url
        else
        payment.error
    end  

    def execute
        if Billing.execute_payment(current_user,
    params[:paymentId], params[:PayerID])
        redirect_to root_path, notice: 'La  compra se realizó con éxito!'
       else
        render plain: 'No se pudo ejecutar el pago.'
        end
    end
end
