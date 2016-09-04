class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  before_action :find_submission, only: [:edit, :update, :show, :delete]
  #before_action :authorize, only: [:edit, :update, :create, :delete]

  def new
    @submission = Submission.new

    @materials = @submission.materials

    @materials.count.times do
      submission_group = @submission.submission_groups.build
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
      render :new

    end
  end


  def show
  end


  def self.process_all_payments
    Submission.all.each { |sub| process_one_payment(sub) }
  end

  def self.process_one_payment(submission)
    puts "Processing submission with id #{submission.id}"
  end

private


  def submission_params
    params.require(:submission).permit(:recycler_id, submission_groups_attributes: [:material, :submission_id, :quantity])
  end

  def find_submission
    @submission = Submission.find(params[:id])
  end

  def image_params
    params.require(:submission).permit(:image)
  end

end
