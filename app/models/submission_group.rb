class SubmissionGroup < ApplicationRecord
  belongs_to :material
  belongs_to :submission
end
