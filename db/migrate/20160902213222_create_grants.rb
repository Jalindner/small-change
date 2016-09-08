class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :sponsor_id 
      t.float :original_amount, precision: 2
      t.float :amount, precision: 2
      t.timestamps null:false
    end
  end
end
