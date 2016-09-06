class GrantsController < ApplicationController
  def index
    @grants = Grant.all
  end

  def show
    @grant = Grant.find(params[:grant_id])
  end

  def new
    if !current_sponsor
      redirect_to '/'
    end
    @grant = Grant.new
  end

  def create

    @new_grant = Grant.new(amount: grant_params[:amount], original_amount: grant_params[:amount])
    @new_grant.sponsor_id = current_sponsor.id

    if @new_grant.save
      redirect_to "/grants/#{@new_grant.id}"
    else
      puts "Errors:"
      puts @new_grant.errors.full_messages
      redirect_to "/"
    end
  end

  def grant_transactions_report
    @result = Braintree::SettlementBatchSummary.generate(
      Time.now.strftime("%Y-%m-%d")
    )
  end

  def grant_params
    params.require(:grant).permit(:'card-number', :cvv, :'expiration-date', :amount)
  end

  def self.total
    return Grant.sum(:amount)
  end

end


  # def transaction
  #   new_transaction = Braintree::Transaction.sale(
  #     amount: params[:amount],
  #     payment_method_nonce: params['client-nonce'],
  #     options: {submit_for_settlement: true}
  #     )
  #   puts "Transaction creation was successful!"
  #   puts "it looks like this: #{new_transaction}, a type of #{new_transaction.class}"
  # end
  # def generate_client_token
  #   token = Braintree::ClientToken.generate
  #   render '/payments/_token', layout: false, locals: {token: token}
  # end
