class Recycler < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  has_many :payments, through: :submissions
  has_many :grants, through: :payments
  has_many :sponsors, through: :grants

  has_many :votes, as: :voter

  has_many :donations
  has_many :charities, through: :donations

end
