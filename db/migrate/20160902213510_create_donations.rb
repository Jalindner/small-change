class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :recycler_id
      t.integer :charity_id
      t.integer :amount
      t.timestamps null:false
    end
  end
end
