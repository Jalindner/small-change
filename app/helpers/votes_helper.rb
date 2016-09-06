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
      #if recycler.voted_for? sub
      if !recycler_voted_for(recycler, sub)
        votable_submissions << sub
      end
    end
    votable_submissions

  end

  def recycler_voted_for(recycler, sub)

    all_recycler_submissions = recycler.find_voted_items
    return all_recycler_submissions.include?(sub)
  end

end
