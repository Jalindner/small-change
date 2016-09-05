class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :grant_id, null:false
      t.integer :submission_id, null:false
      t.float :amount
      t.timestamps null:false
    end
  end
end
