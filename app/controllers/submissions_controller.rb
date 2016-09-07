class SubmissionsController < ApplicationController
  def index
  end

  def review
    if current_recycler && current_recycler.id = 1
      @submissions = Submission.all
    else
      redirect_to root_url
    end
  end


  before_action :find_submission, only: [:edit, :update, :show, :delete]
  #before_action :authorize, only: [:edit, :update, :create, :delete]

  def new
    if recycler_session

      if current_recycler.find_voted_items.count >= count_recycler_votes_threshold(current_recycler)
        @submission = Submission.new

        @materials = @submission.materials.keys

        @materials.count.times do
          submission_group = @submission.submission_groups.build
        end
      else
        flash[:notice] = 'You must vote for more submissions before you can make another submission'
        redirect_to '/'
      end

    else
      redirect_to '/recyclers/sign_in'
    end

  end

  def create
    @submission = Submission.new(image_params)
    #@submission.recycler_id = submission_params[:recycler_id]
    @submission.recycler_id = current_recycler.id

    if @submission.save
      flash[:notice] = "Successfully created submission."

      submission_params[:submission_groups_attributes].each do |group|
        group_params = submission_params[:submission_groups_attributes][group]

        submission_group = SubmissionGroup.new(group_params)
        submission_group.submission_id = @submission.id
        if !submission_group.save
          #TODO: error management when creating submission_groups in the template
          puts "error while creating the submission group: #{submission_group}"
          puts submission_group.errors.full_messages
        end
      end
      #TODO: submission show
      redirect_to @submission
    else
      flash[:error] = "Sorry, but you were missing some info"
      redirect_to '/submissions/new'
    end
  end

  def show
    submission = Submission.find(params[:id])
  end


  def upvote
    @submission = Submission.find(params[:id])
    @submission.upvote_by current_recycler
    if @submission.get_upvotes.size >= 3
      @submission.status = 'Approved'

      total = 0.00

      @submission.submission_groups.each do |subm_group|
        total += (0.01 * subm_group.weight)
      end

      eligible_grants = Grant.where("amount >= #{total}")

      if eligible_grants
        random_grant = Grant.find(rand(1..Grant.count))
        payment = Payment.new(
          submission_id: @submission.id,
          grant_id: random_grant.id,
          amount: total
          )
        if !payment.save
          puts payment.errors.full_messages
        end
        random_grant.amount -= total
        random_grant.save
        @submission.status = "Paid"
      end

      @submission.save
    end # end of if @submission.get_upvotes.size >= 3
  end # end of def upvote

  def downvote
    @submission = Submission.find(params[:id])
    @submission.downvote_by current_recycler
    if @submission.get_downvotes.size >= 3
      @submission.status = 'Denied'
    end
    redirect_to '/votes'
  end

  def self.process_all_payments
    Submission.all.each { |sub| process_one_payment(sub) }
  end

  def self.process_one_payment(submission)
    puts "Processing submission with id #{submission.id}"
  end



private
  def submission_params
    params.require(:submission).permit(:recycler_id, submission_groups_attributes: [:material, :submission_id, :weight])
  end

  def find_submission
    @submission = Submission.find(params[:id])
  end

  def image_params
    params.require(:submission).permit(:image)
  end
end
