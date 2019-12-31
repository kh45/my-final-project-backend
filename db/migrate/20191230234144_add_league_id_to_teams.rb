class AddLeagueIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :league_id, :integer
  end
end
