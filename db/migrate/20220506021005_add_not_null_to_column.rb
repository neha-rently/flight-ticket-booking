class AddNotNullToColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:passengers, :email, false)
    change_column_null(:passengers, :contact, false)
    change_column_null(:passengers, :name, false)
    change_column_null(:passengers, :age, false)
  end
end
