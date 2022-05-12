class AddForeignKeyToTickets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :users, null: false, foreign_key: true
  end
end
