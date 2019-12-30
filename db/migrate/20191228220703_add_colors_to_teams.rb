class AddColorsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :primaryColor, :string
    add_column :teams, :secondaryColor, :string
    add_column :teams, :tertiaryColor, :string
    add_column :teams, :quaternaryColor, :string
  end
end
