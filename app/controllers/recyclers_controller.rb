class RecyclersController < ApplicationController
  # def index
  # end

  def show
    @submissions = Submission.where(recycler_id: current_recycler.id)
  end

  def signin
  end

end
