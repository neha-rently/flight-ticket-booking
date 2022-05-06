class AddUniqueConstraintToPassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :contact

      t.timestamps
    end
    add_index :passengers, [:email, :contact], :unique => true
  end
end
