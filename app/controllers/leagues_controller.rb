class LeaguesController < ApplicationController

    def index
        leagues = League.all
        render json: leagues.to_json(:include => :teams, :except => [:updated_at])
    end
    
    def NBAHome
        leagueLeaders_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/leaders.json?api_key=cgp756j3uygfn3kqzcbj8xex')
        leagueLeaders = JSON.parse(leagueLeaders_raw)

        leagueStandings_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/standings.json?api_key=cgp756j3uygfn3kqzcbj8xex')
        leagueStandings = JSON.parse(leagueStandings_raw)

        sleep 1

        upcomingGames_raw = RestClient.get("http://api.sportradar.us/nba/trial/v7/en/games/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}/schedule.json?api_key=cgp756j3uygfn3kqzcbj8xex")
        upcomingGames = JSON.parse(upcomingGames_raw)

        # byebug

        render json: {leaders: leagueLeaders, standings: leagueStandings, games: upcomingGames}
        # render json: {leaders: leagueLeaders, games: upcomingGames}

    end

    def NFLHome
        # leagueLeaders_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/leaders.json?api_key=sa6bcrzgfpyff5t5ynbe7evf')
        # leagueLeaders = JSON.parse(leagueLeaders_raw)

        # leagueStandings_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/standings.json?api_key=sa6bcrzgfpyff5t5ynbe7evf')
        # leagueStandings = JSON.parse(leagueStandings_raw)

        leagueNews_raw = RestClient.get("https://newsapi.org/v2/everything?domains=nfl.com&apiKey=f44ccf725ca9471596da059a5defc2fc")

        leagueNews_fresh = JSON.parse(leagueNews_raw)

        render json: {articles: leagueNews_fresh}

    end
end
