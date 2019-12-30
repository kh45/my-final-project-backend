class User < ApplicationRecord
    has_many :user_leagues
    has_many :leagues, through: :user_leagues
    has_many :user_players
    has_many :players, through: :user_players
end
