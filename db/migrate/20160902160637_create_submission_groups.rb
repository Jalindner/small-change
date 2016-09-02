class CreateSubmissionGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_groups do |t|
      t.integer :submission_id
      t.string :material
      t.integer :quantity

      t.timestamps
    end
  end
end
