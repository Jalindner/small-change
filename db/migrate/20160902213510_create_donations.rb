class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :recycler_id, null:false
      t.integer :charity_id, null:false
      t.float :amount, precision: 2
      t.timestamps null:false
    end
  end
end
