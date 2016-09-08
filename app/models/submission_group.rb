class SubmissionGroup < ApplicationRecord

  belongs_to :submission

  validates :quantity, presence: true
  validates :material, presence: true

end
