class Sponsor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :logo, styles:{ display: '500x250#' }
  validates_attachment_content_type :logo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  has_many :grants
  has_many :payments, through: :grants
  has_many :submissions, through: :payments
  has_many :recyclers, through: :submissions

end
