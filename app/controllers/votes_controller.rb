class VotesController < ApplicationController
  def index
    random_id = rand(1..Submission.count)
    @random_submission = Submission.find(random_id)
    puts "______________________"
    puts current_recycler.id
    puts @random_submission.recycler_id
    puts "______________________"
  end
end
