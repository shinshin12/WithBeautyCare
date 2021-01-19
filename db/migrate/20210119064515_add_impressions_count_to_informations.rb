class AddImpressionsCountToInformations < ActiveRecord::Migration[6.0]
  def change
    add_column :information, :impression_count, :integer, default:0
  end
end
