class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :timeline_id

      t.timestamps null: false
      t.index [:timeline_id, :user_id], :unique => true
    end
    
  end
end
