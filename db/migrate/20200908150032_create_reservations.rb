class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :court, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
