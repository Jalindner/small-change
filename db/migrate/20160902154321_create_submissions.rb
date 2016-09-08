class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :recycler_id, null:false
      t.string :status, default: "Submitted"
      t.timestamps null:false
    end
  end

end
