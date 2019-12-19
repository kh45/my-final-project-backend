class AddTeamRefToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :teamRef, :string
  end
end
