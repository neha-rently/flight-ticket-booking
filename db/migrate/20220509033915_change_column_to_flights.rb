class ChangeColumnToFlights < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :arr_time, :time
    change_column :flights, :dep_time, :time
    change_column_null :flights, :flight_no, false
    change_column_null :flights, :journey_date, false
    change_column_null :flights, :arr_time, false
    change_column_null :flights, :dep_time, false
    change_column_null :flights, :departing, false
    change_column_null :flights, :arriving, false
    change_column_null :flights, :flight_status, false
    change_column_null :flights, :seats_available, false
  end
end
