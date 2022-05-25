class ChangeNotNullToFlights < ActiveRecord::Migration[6.1]
  def change
    change_column_null :flights, :economy, false
    change_column_null :flights, :business, false
  end
end
