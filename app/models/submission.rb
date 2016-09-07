class Submission < ApplicationRecord
  acts_as_votable
  has_many :payments
  has_many :submission_groups

  belongs_to :recycler
  accepts_nested_attributes_for :submission_groups
  has_attached_file :image, styles: { square: '200x200#' }
  validates_presence_of :image
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'

  validates :recycler_id, presence: true

  def materials
    { plastic: ['plastic drink bottle',
      'plastic food container',
      'laundry detergent bottle',
      'gallon milk jug'],

      metal: ['aluminum beverage can',
      'tin or steel food can'],

      glass: ['glass jar or bottle',
      'large glass bottle'],

      paper: ['newspaper',
      'magazine',
      'junk mail',
      'small stack of office paper',
      'cardboard box',
      'telephone book',
      'paper bag',
      'cereal box',
      'paper towel roll'] }
  end

end
