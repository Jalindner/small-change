class CreateSubmissionDataObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_data_objects do |t|
      t.integer :submission_id
    end
  end
  def self.upload

  end
end
