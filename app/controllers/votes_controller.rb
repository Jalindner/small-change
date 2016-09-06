
class VotesController < ApplicationController

  def index
    votable_submissions = get_votable_submissions(current_recycler)
    @random_submission = submissions.sample
    puts '_______________________'
    p @random_submission.recycler_id
    p current_recycler.id
    puts '_______________________'
  end


end
