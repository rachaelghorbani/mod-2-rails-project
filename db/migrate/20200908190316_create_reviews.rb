class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :player_id
      t.integer :court_id
      t.text :review

      t.timestamps
    end
  end
end
