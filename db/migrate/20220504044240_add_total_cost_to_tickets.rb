class AddTotalCostToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :total_cost, :float
  end
end
