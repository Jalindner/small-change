class CharitiesController < ApplicationController
  # def index
  # end
  def new
    if recycler_session || charity_session || sponsor_session
      flash[:notice] = 'You are already signed in'
      redirect_to '/'
    end
  end

  def signin
    if recycler_session || charity_session || sponsor_session
      flash[:notice] = 'You are already signed in'
      redirect_to '/'
    end
  end

end
