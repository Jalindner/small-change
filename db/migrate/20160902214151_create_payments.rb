class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :grant_id
      t.integer :submission_id
      t.float :amount
      t.timestamps null:false
    end
  end
end
