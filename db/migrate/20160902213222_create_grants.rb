class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :sponsor_id
      t.float :amount
      t.timestamps null:false
    end
  end
end
