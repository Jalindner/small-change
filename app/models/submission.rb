class Submission < ApplicationRecord
  has_many :submission_groups
  has_many :materials, through: :submission_groups
  # belongs_to :user
end
