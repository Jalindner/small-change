class DonationsController < ApplicationController
  def index
    if current_recycler
      @donations = current_recycler.donations
    elsif current_charity
      @donations = current_charity.donations
    end
  end

  def create
    new_donation = Donation.new(donation_params)
    new_donation.recycler_id = current_recycler.id
    new_donation.charity_id = params[:charity_id]
    if new_donation.save
      redirect_to "/donations/#{new_donation.id}"
    else
      render '/donations/new'
    end

    # new_transaction = Braintree::Transaction.sale(
    # amount: donation_params[:amount],
    # payment_method_nonce: params['client-nonce'],
    # options: {submit_for_settlement: true}
    # )
  end

  def new
    @donation = Donation.new
  end

  def show
    @donation = Donation.find(params[:id])
  end


  private
  def donation_params
    params.require(:donation).permit(:charity_id, :amount)
  end

end
