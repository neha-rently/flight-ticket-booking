class DropSeatNoFromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :seat_no
  end
end
