class AddUniqueToPassengers < ActiveRecord::Migration[6.1]
  def change
    add_index :passengers, :contact, unique: true
  end
end
