class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.to_json(:include => :leagues, :except => [:updated_at])
    end

    def show
        user = User.find(params[:id])
        # byebug
        render json: user.to_json(:include => {
            :leagues => {:except => [:created_at]},
            :players => {:except => [:created_at]}},  :except => [:updated_at])
    end

    def home
        news_articles = []
        # str = "http://api.sportradar.us/nba/trial/v7/en/games/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}/schedule.json?api_key=sa6bcrzgfpyff5t5ynbe7evf"
        # # byebug
        if params[:leagues].include?('NBA')
            nbagames_today_raw = RestClient.get("http://api.sportradar.us/nba/trial/v7/en/games/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}/schedule.json?api_key=sa6bcrzgfpyff5t5ynbe7evf")

            nbagames_today_fresh = JSON.parse(nbagames_today_raw)

            nbanews_raw = RestClient.get('https://newsapi.org/v2/everything?domains=nba.com&apiKey=f44ccf725ca9471596da059a5defc2fc')
            nbanews_fresh = JSON.parse(nbanews_raw)
            # nbanews_filtered = nbanews_fresh.delete_if {|article, content| content == nil}
            nbanews_filtered = nbanews_fresh["articles"].select {|article| article["content"] != nil}
            top_headlines = nbanews_filtered.length >= 3 ? nbanews_filtered.slice(0,3) : nbanews_filtered.slice(0, nbanews_filtered.length) 
            render json: {articles: top_headlines, games: nbagames_today_fresh, teams: Team.all}
        end

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

    def followPlayer
        player = Player.find_by(NBARef: params["id"])
        user = User.find(params["user"])
        
        if !user.players.include?(player) && params["myAction"] == "follow"
            UserPlayer.create(user: user, player: player)
        end

        if user.players.include?(player) && params["myAction"] == "UNfollow"
            userPlayer = UserPlayer.find_by(user_id: user.id, player_id: player.id)
            UserPlayer.destroy(userPlayer.id)
        end

        render json: user.to_json(:include => {
            :leagues => {:except => [:created_at]},
            :players => {:except => [:created_at]}},  :except => [:updated_at])
    end

end
