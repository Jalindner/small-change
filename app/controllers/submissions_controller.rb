class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
    @submission_group = @submission.submission_groups.build
    @materials = @submission.materials
    @sub_data_obj = SubmissionDataObject.new
  end

  def create
    # Draft A
    puts "==============params========="
    p submission_data_params
    @submission = Submission.new(submission_data_params)
    if @submission.save
      redirect_to @submission
    else
      render action: 'new'
    end
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

def submission_data_params
  params.require(:submission).permit(:id, :image)

end
