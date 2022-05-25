class AddCostToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :cost, :float
  end
end
