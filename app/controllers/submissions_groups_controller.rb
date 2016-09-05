class SubmissionsGroupsController < ApplicationController

  def create
    puts "==============params========="
    p submission_params
    @submission_group = SubmissionGroup.new

  end

  def show
    #to implement?
  end
end


private

def submission_groups_params
  # Draft A
  params.require(:submission).permit(submission_groups_attributes: [:material, :submission_id, :weight])
end
