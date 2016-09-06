
class VotesController < ApplicationController

  def index

      votable_submissions = get_votable_submissions(current_recycler)
      if !votable_submissions.empty?
        @random_submission = votable_submissions.sample
      else
        flash[:error] = "Wow! You've managed to vote on every submission!"
        redirect_to '/'
      end

  end


end
