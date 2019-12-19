class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.to_json(:include => :leagues, :except => [:updated_at])
    end

    def login
        user = User.find_by(username: params["username"], password: params["password"])
        # User.find_by(username:"UsernameIsMyUsername",password:"Mypassword")
        if user
            render json: user.to_json(:include => :leagues, :except => [:updated_at])
        end
    end


    def addLeague
        user = User.find(params["User"])
        league = League.find_by(name: params["League"])

        if !user.leagues.include?(league)
            UserLeague.create(user: user, league: league)
        end
        
        render json: user.to_json(:include => :leagues, :except => [:updated_at])
    end

end
