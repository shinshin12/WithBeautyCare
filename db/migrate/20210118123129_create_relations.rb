class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.references :user, foreign_key: true
      t.integer :follower_id
      t.integer :followed_id
      t.text :image
      t.timestamps
    end
    add_index :relations, [:follower_id, :followed_id], unique: true
  end
end
