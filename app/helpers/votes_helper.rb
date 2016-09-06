module VotesHelper

@votes_per_submission = 3

  def count_recycler_votes(recycler)
    recycler.find_voted_items.count
  end

  def count_recycler_votes_threshold(recycler)
    recycler.submissions.count * @votes_per_submission
  end

  def get_votable_submissions(recycler)
    votable_submissions = []
    submissions = Submission.where.not(recycler_id: recycler.id)
    submissions.each do |sub|
      if !recycler.voted_for? sub
        votable_submissions << sub
      end
    end

  end

end
