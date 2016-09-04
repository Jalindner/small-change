class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end
  def new
    @submission = Submission.new

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
    @submission = Submission.find_by(id: params[:id])
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
