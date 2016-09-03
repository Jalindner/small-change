Rails.application.routes.draw do

  get '/sponsors/sign_in' => 'sponsors#signin', as: :newer_sponsor_session
  get '/recyclers/sign_in' => 'recyclers#signin', as: :newer_recycler_session
  get '/charities/sign_in' => 'charities#signin', as: :newer_charity_session

  get '/sponsors/sign_up' => 'sponsors#new', as: :newer_sponsor_registration
  get '/recyclers/sign_up' => 'recyclers#new', as: :newer_recycler_registration
  get '/charities/sign_up' => 'charities#new', as: :newer_charity_registration

  resources :submissions

  devise_for :recyclers
  devise_for :sponsors
  devise_for :charities

  root 'welcome#dashboard'

end
