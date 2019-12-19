class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :alias
      t.string :market
      t.string :sportradarRef
      t.string :NBARef

      t.timestamps
    end
  end
end
