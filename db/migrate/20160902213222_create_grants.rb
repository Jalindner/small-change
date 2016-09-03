class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :sponsor_id
      t.integer :amount
      t.timestamps null:false
    end
  end
end
