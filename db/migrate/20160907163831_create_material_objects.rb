class CreateMaterialObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :material_objects do |t|

      t.string :category, null:false
      t.string :subcategory, null:false
      t.float :price, null:false

      t.timestamps
    end
  end
end
