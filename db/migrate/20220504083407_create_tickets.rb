class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :checkin_status
      t.string :seat_class
      t.string :seat_no
      t.string :luggage
      t.string :food
      t.float :total_cost
      t.references :passenger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
