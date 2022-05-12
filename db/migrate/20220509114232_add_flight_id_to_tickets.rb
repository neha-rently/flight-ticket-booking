class AddFlightIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :flights, foreign_key: true
  end
end
