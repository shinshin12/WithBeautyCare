class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.references :information, null: false, foreign_key: true
      t.timestamps
    end
  end
end
