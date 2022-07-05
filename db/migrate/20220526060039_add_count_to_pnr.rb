class AddCountToPnr < ActiveRecord::Migration[6.1]
  def change
    add_column :pnrs, :count, :integer, null: false
  end
end
