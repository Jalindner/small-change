class CreateSubmissionGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_groups do |t|
      t.integer :material_id
      t.integer :submission_id
      t.integer :total_weight
      t.timestamps
    end
  end
end
