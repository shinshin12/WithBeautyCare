class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.references :user,null: false, foreign_key: true
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
  end
end
