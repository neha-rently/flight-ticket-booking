class AddCostToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :economy, :float
    add_column :flights, :business, :float
  end
end
