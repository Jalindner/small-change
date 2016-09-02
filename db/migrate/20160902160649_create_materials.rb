class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.float :price_per_weight
      t.timestamps
    end
  end
end
