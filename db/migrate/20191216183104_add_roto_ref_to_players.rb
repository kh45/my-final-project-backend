class AddRotoRefToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :rotoRef, :string
  end
end
