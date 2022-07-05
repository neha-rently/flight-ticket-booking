class CreatePnrs < ActiveRecord::Migration[6.1]
  def change
    create_table :pnrs do |t|
      t.date :booking_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
