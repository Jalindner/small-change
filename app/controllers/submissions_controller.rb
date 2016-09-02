class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    @materials = Material.all
  end

  def create

  end

  def show

  end
end
