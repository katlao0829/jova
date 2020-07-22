class CreateDirectmessages < ActiveRecord::Migration[6.0]
  def change
    create_table :directmessages do |t|
      t.text :content
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
