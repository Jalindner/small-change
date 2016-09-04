class Submission < ApplicationRecord
  has_many :submission_groups
  belongs_to :recycler
  accepts_nested_attributes_for :submission_groups

  validates :recycler_id, presence: true

  def materials
    ['plastic', 'aluminum', 'glass', 'cardboard', 'paper']
  end
end
