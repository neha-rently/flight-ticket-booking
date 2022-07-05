class CreatePnrHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :pnr_histories do |t|
      t.references :pnr, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
