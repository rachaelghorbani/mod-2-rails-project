class CreateTennisCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :tennis_courts do |t|
      t.text :prop_id
      t.string :name
      t.text :location
      t.text :phone
      t.integer :courts
      t.string :indoor_outdoor
      t.string :court_type
      t.text :info

      t.timestamps
    end
  end
end
