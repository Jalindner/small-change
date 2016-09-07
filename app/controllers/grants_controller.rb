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
    @months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    puts '______________________________'
    p @months
    puts '______________________________'
  end


  def create
    expiration_date = params[:month] + '-' + params[:year]
    p expiration_date
    if /\A\d{3}\z/ === grant_params[:cvv] && /\A\d{2}\S\d{4}\z/ === expiration_date && /\A[0-9]{12}(?:[0-9]{4})/ === grant_params[:'card-number']
      @new_grant = Grant.new(amount: grant_params[:amount], original_amount: grant_params[:amount])
      @new_grant.sponsor_id = current_sponsor.id

      if @new_grant.save
        redirect_to "/grants/#{@new_grant.id}"
      else
        puts "Errors:"
        puts @new_grant.errors.full_messages
        redirect_to "/"
      end
    else
      puts "Error: credit card information invalid"
      @errors = ["Error: Credit card information invalid"]
      render '/grants/new'
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
