class AddNbaRefToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :NBARef, :string
  end
end
