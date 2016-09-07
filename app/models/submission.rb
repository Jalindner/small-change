class Submission < ApplicationRecord
  acts_as_votable
  has_many :payments
  has_many :submission_groups
  #validates_presence_of :submission_groups
  belongs_to :recycler
  accepts_nested_attributes_for :submission_groups
  has_attached_file :image, styles: { square: '200x200#' }
  validates_presence_of :image
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'

  validates :recycler_id, presence: true
  #before_create :init_materials

  def value
    value = 0.0

    self.submission_groups.each do |subm_group|
      value += (0.01 * subm_group.weight)
    end

    value
  end

end
