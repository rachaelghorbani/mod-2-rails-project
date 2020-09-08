class AddLongitudeToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :longitude, :decimal
  end
end
