class Payment < ActiveRecord::Base
  belongs_to :grant
  belongs_to :submission
end
