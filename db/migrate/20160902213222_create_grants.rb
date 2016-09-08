class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :sponsor_id, null:false
      t.float :original_amount
      t.float :amount, precision: 2
      t.timestamps null:false
    end
  end
end
