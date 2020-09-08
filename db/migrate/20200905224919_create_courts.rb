class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.text :prop_id
      t.string :name
      t.text :location
      t.text :phone
      t.integer :number_of_courts
      t.string :indoor_outdoor
      t.string :court_type
      t.text :info
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
