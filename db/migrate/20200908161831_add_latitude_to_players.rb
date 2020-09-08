class AddLatitudeToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :latitude, :decimal
  end
end
