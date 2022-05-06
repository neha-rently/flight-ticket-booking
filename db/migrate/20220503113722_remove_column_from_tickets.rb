class RemoveColumnFromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets,:pass_id
  end
end
