class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :sportradarRef
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.integer :height
      t.integer :weight
      t.string :position
      t.string :primary_position
      t.string :jersey_number
      t.string :experience
      t.string :college
      t.string :high_school
      t.string :birthdate

      t.timestamps
    end
  end
end
