class Grant < ActiveRecord::Base
  belongs_to :recycler
  belongs_to :charity
end
