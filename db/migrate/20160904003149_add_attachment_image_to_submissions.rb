class AddAttachmentImageToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :image

      # , null:false
    end
  end

  def self.down
    remove_attachment :submissions, :image
  end
end
