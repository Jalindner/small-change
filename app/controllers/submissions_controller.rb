class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
    @submission_group = @submission.submission_groups.build
    @materials = @submission.materials

  end

  def create
    # Draft A
    puts "==============params========="
    p submission_params
    @submission = Submission.new



  end

  def show
    @submission = Submission.find(1)
  end
end

private


def submission_params
  # Draft A
  params.require(:submission).permit(submission_groups_attributes: [:material, :submission_id, :quantity])
end
