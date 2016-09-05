class CreateSubmissionDataObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_data_objects do |t|
      t.integer :submission_id, null:false
    end
  end
  def self.upload
    add_attachment :submission_data_objects, :image
  end

  def self.download
    remove_attachment :submission_data_objects, :image
  end
end
