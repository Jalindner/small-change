class Submission < ApplicationRecord
  has_many :submission_groups
  # Draft A
  # has_many :materials, through: :submission_groups
  accepts_nested_attributes_for :submission_groups
  # belongs_to :user

  def materials
    ['plastic', 'aluminum', 'glass', 'cardboard', 'paper']
  end
end
