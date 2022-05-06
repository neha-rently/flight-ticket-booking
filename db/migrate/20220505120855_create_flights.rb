class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :flight_no
      t.date :journey_date
      t.time :arr_time
      t.time :dep_time
      t.string :departing
      t.string :arriving
      t.string :flight_status
      t.integer :seats_available

      t.timestamps
    end
  end
end
