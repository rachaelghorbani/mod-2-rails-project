class AddBoroughToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :borough, :string
  end
end
