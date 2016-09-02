class Material < ActiveRecord::Base
  def self.materials
    ['plastic', 'aluminum', 'glass', 'cardboard', 'paper']
  end
end
