class CustomFailure < Devise::FailureApp
  def redirect_url
   # get '/sign_in' => '/welcome#dashboard'
   redirect_to root_path 
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_path
    end
  end
end