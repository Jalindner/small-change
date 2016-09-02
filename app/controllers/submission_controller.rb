class SubmissionController < ApplicationController
  def new
    @submission = Submission.new
  end
end
