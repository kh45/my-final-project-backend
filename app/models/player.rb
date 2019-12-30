class Player < ApplicationRecord
    # belongs_to :teamRef, :foreign_key => 'teamRef', :class_name  => 'Team', :primary_key => 'sportradarRef'
    belongs_to :team
    has_many :user_players
    has_many :users, through: :user_players
end
