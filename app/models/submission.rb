class Submission < ApplicationRecord
  has_many :submission_groups
  accepts_nested_attributes_for :submission_groups

  def materials
    ['plastic', 'aluminum', 'glass', 'cardboard', 'paper']
  end
end
