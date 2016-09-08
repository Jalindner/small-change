class SubmissionsGroupsController < ApplicationController

  def create
    p submission_params
    @submission_group = SubmissionGroup.new

  end

  def show
    #to implement?
  end
end


private

def submission_groups_params
  params.require(:submission).permit(submission_groups_attributes: [:material, :submission_id, :quantity])
end
