class PaymentsController < ApplicationController

  def generate_client_token
    token = Braintree::ClientToken.generate
    render '/payments/_token', layout: false, locals: {token: token}
  end

  def generate_transaction
    puts "Got to the generate_transaction method!!!!!!!!!!!!!!!!!!!"
    puts "Our nonce is #{params['client-nonce']}, a type of #{params['client-nonce'].class}"

    new_transaction = Braintree::Transaction.sale(
      amount: "00.01",
      payment_method_nonce: params['client-nonce'])

    puts "Transaction creation was successful!"
    puts "it looks like this: #{new_transaction}, a type of #{new_transaction.class}"
  end

end
