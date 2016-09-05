Rails.application.routes.draw do

  get '/sponsors/sign_in' => 'sponsors#signin', as: :newer_sponsor_session
  get '/recyclers/sign_in' => 'recyclers#signin', as: :newer_recycler_session
  get '/charities/sign_in' => 'charities#signin', as: :newer_charity_session

  get '/sponsors/sign_up' => 'sponsors#new', as: :newer_sponsor_registration
  get '/recyclers/sign_up' => 'recyclers#new', as: :newer_recycler_registration
  get '/charities/sign_up' => 'charities#new', as: :newer_charity_registration


  get '/grants' => 'grants#index'
  get '/grants/new' => 'grants#new'
  post '/grants' => 'grants#generate_transaction'
  get '/client_token' => 'grants#generate_client_token'
  get '/grant_transactions_report' => 'grant_transactions_reportts#grant_transactions_report'


  get '/submissions/review' => 'submissions#review'

  resources :submissions do
    member do
      put "like", to: "submissions#upvote"
      put "dislike", to: "submissions#downvote"
    end
  end

  post '/payments' => 'payments#create'
  get '/payments/process_all' => 'payments#process_all_payments', as: :process_all_payments
  get '/payments/process/:submission_id'  => 'payments#process_payment'



  devise_for :recyclers
  devise_for :sponsors
  devise_for :charities

  get '/recyclers/:id' => 'recyclers#show'
  get '/welcome/calculator' => 'welcome#calculator'
  root 'welcome#dashboard'

end
