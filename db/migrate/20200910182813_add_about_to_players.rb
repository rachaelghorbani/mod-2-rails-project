class AddAboutToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :about, :text
  end
end
