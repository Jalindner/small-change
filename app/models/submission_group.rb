class SubmissionGroup < ApplicationRecord

  belongs_to :submission

  validates :weight, presence: true
  validates :material, presence: true

end
