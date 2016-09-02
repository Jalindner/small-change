Rails.application.routes.draw do

  devise_for :grants
  devise_for :donations
  devise_for :recyclers
  devise_for :sponsors
  devise_for :charities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'recyclers#signin'

end
