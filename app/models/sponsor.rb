class Sponsor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :grants
  has_many :payments, through: :grants
  has_many :submissions, through: :payments
  has_many :recyclers, through: :submissions

end
