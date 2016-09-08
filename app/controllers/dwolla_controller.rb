class DwollaController < ApplicationController

  require 'dwolla'


  def home
    Dwolla::api_key = "9oa2TMC3oD3WbGYHh1CAi0aUk1cpi4huXTmgsCKvDFsrNgPKXp"
    Dwolla::api_secret = "jwb0lwKOffeFBp7dlsUueyr8V3f6xhmpUqZYOf3ecQ97x4ipzq"

    redirect_uri = 'https://small-change.herokuapp.com/oauth_return'

    @oauth_url = Dwolla::OAuth.get_auth_url(redirect_uri)
  end

# https://www.dwolla.com/oauth/v2/authenticate?client_id=0gX6rdOus0Ciq7f7lksjxoEcmaDlGol4PZsb6Lgkfsism7AwtW&redirect_uri=https%3A%2F%2Fsmall-change.herokuapp.com%2Foauth_return&response_type=code&scope=send%7Ctransactions%7Cbalance%7Crequest%7Ccontacts%7Caccountinfofull%7Cfunding%7Cscheduled
# https://www.dwolla.com/oauth/v2/authenticate?client_id=0gX6rdOus0Ciq7f7lksjxoEcmaDlGol4PZsb6Lgkfsism7AwtW&redirect_uri=https://small-change.herokuapp.com/oauth_return&response_type=code&scope=send|transactions|balance|request|contacts|accountinfofull|funding|scheduled


  def oauth_return
    code = params['code']
    info = Dwolla::OAuth.get_token(code, redirect_uri)
    token = info['access_token']
    refresh_token = info['refresh_token']
    "Your expiring OAuth access token is: <b>#{token}</b>, and your refresh token is <b>#{refresh_token}</b>"


    Dwolla::token = @token
    Dwolla::debug = true

    transactionId = Dwolla::Transactions.send({
      :destinationId => 'robzd1@gmail.com',
      :destinationType => 'Email',
      :amount => 1.00,
      :pin => 1234,
      :notes => 'Everyone loves getting money'})

  end


end
