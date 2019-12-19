class AddHeadshotToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :headshot, :string
  end
end
