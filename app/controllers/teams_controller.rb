class TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams.to_json(to_serialized_json)
    end

    def NBATeams
        nba = League.find(1)
        # render json: nba
        render json: nba.teams.to_json(to_serialized_json)
    end

    def NFLTeams
        nfl = League.find(3)
        # render json: nba
        render json: nfl.teams.to_json(to_serialized_json)
    end

    private

    def to_serialized_json
        {
    :include => {:players => {
            :except => [:created_at, :updated_at]
        }},
        :except => [:created_at, :updated_at]
    }
    end

end
