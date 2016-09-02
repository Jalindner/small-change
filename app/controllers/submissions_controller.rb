class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    # Draft A
    # @materials = Material.all
    # @submission_group_array = []
    # @submission.materials.each do |mat|
    @submission_group = @submission.submission_groups.build
  end

  def create
    # Draft A
    puts "==============params========="
    p submission_params
    @submission = Submission.new
    # if @submission.save?
    #   SubmissionGroup.new(submission_id: @submission.id)
    #   redirect_to @submission
    # end


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
