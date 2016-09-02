class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    # Draft A
    # @materials = Material.all
    # @submission_group = @submission.submission_groups.build
  end

  def create
    # Draft A
    # puts "==============params========="
    # p submission_params
    # @submission = Submission.new()
    # if @submission.save?
    #   Material.all.each do |material|
    #     SubmissionGroup.create(submission_id: @submission.id, material_id: 1)
    #   end
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
  # params.require(:submission).permit(:recycler_id, submission_groups_attributes: [:material_id, :submission_id, :total_weight])

end
