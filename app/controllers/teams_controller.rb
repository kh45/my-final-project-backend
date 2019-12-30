class TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams.to_json(to_serialized_json)
    end

    def NBATeams
        teams = Team.all
        render json: teams.to_json(to_serialized_json)
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
