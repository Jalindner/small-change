class GrantsController < ApplicationController

  def generate_client_token
    token = Braintree::ClientToken.generate
    render '/payments/_token', layout: false, locals: {token: token}
  end

  def generate_transaction
    puts "Got to the generate_transaction method!!!!!!!!!!!!!!!!!!!"
    puts "Our nonce is #{params['client-nonce']}, a type of #{params['client-nonce'].class}"
    puts "passing this amount: #{params[:amount]}, a type of #{params[:amount].class }"



    new_transaction = Braintree::Transaction.sale(
      amount: params[:amount],
      payment_method_nonce: params['client-nonce'],
      options: {submit_for_settlement: true}
      )
    puts "Transaction creation was successful!"
    puts "it looks like this: #{new_transaction}, a type of #{new_transaction.class}"

    puts "Now let's create a new grant object in our database!"
    new_grant = Grant.new(sponsor_id: 1, amount: params[:amount].to_f)

    if new_grant.save
      puts "Grant saved to the database!!!!!!!!!!!!!!!"
    else
      puts "Grant was NOT saved to the database!!!!!!!!!!!!!!!"
      puts "Errors:"
      puts new_grant.errors.full_messages
    end
  end

  def grant_transactions_report
    puts "Settling transactions!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    @result = Braintree::SettlementBatchSummary.generate(
      Time.now.strftime("%Y-%m-%d")
    )
  end



  def self.total
    return Grant.sum(:amount)
  end

end
