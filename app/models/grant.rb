class Grant < ActiveRecord::Base
  belongs_to :sponsor
  has_many :payments
end
