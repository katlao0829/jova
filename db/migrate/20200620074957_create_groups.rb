class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.text :info, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
