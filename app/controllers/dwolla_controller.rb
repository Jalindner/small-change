class DwollaController < ApplicationController

  require 'dwolla'

  def home
    Dwolla::api_key = ENV["DWOLLA_API_KEY"]
    Dwolla::api_secret = ENV["DWOLLA_API_SECRET"]

    redirect_uri = 'https://small-change.herokuapp.com/oauth_return'

    @oauth_url = Dwolla::OAuth.get_auth_url(redirect_uri)
  end

  def oauth_return
    code = params['code']
    redirect_uri = 'https://small-change.herokuapp.com/oauth_return'
    info = Dwolla::OAuth.get_token(code, redirect_uri)
    token = info['access_token']
    refresh_token = info['refresh_token']
    "Your expiring OAuth access token is: <b>#{token}</b>, and your refresh token is <b>#{refresh_token}</b>"

    Dwolla::token = token
    Dwolla::debug = true

    transactionId = Dwolla::Transactions.send({
      :destinationId => 'robzd1@gmail.com',
      :destinationType => 'Email',
      :amount => 1.00,
      :pin => 1234,
      :notes => 'Everyone loves getting money'})

  end
end
