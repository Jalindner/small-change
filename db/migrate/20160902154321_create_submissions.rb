class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :recycler_id

      t.timestamps
    end
  end
  def self.up
    add_attachment :submission, :image
  end

  def self.down
    remove_attachment :submission, :image
  end
end
