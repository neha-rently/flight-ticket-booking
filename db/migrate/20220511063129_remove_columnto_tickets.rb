class RemoveColumntoTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :total_cost
  end
end
