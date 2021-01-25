class CreateInformationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :information_tags do |t|
      t.references :information, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
