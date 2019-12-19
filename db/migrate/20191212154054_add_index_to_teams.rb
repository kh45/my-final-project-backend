class AddIndexToTeams < ActiveRecord::Migration[6.0]
  def change
    add_index :teams, :sportradarRef, unique: true
  end
end
