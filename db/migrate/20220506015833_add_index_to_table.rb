class AddIndexToTable < ActiveRecord::Migration[6.1]
  def change
    add_index :passengers, :email, unique: true
  end
end
