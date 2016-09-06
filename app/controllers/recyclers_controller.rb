class RecyclersController < ApplicationController
  # def index
  # end

  def show
    @submissions = Submission.where(recycler_id: current_recycler.id)
  end
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
