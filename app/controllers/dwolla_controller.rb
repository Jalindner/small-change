class DwollaController < ApplicationController

  require 'dwolla'


  def home
    Dwolla::api_key = "0gX6rdOus0Ciq7f7lksjxoEcmaDlGol4PZsb6Lgkfsism7AwtW"
    Dwolla::api_secret = "8Ud96ZoI8c8fywXxTfOGrSJyEhnsWX6WDxt4xbygnA6w5aXx77"

    redirect_uri = 'http://localhost:3000/oauth_return'
    @oauth_url = Dwolla::OAuth.get_auth_url(redirect_uri)
  end

# https://uat.dwolla.com/oauth/v2/authenticate?client_id=0gX6rdOus0Ciq7f7lksjxoEcmaDlGol4PZsb6Lgkfsism7AwtW&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Foauth_return&response_type=code&scope=send%7Ctransactions%7Cbalance%7Crequest%7Ccontacts%7Caccountinfofull%7Cfunding%7Cscheduled

  def oauth_return
    code = params['code']
    info = Dwolla::OAuth.get_token(code, redirect_uri)
    token = info['access_token']
    refresh_token = info['refresh_token']
    "Your expiring OAuth access token is: <b>#{token}</b>, and your refresh token is <b>#{refresh_token}</b>"
  end


end
