class LeaguesController < ApplicationController

    def NBAHome
        leagueLeaders_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2019/REG/leaders.json?api_key=dnc8cebrxtcamyu4ew4n8pw3')
        leagueLeaders = JSON.parse(leagueLeaders_raw)

        leagueStandings_raw = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/seasons/2018/REG/standings.json?api_key=dnc8cebrxtcamyu4ew4n8pw3')
        leagueStandings = JSON.parse(leagueStandings_raw)

        render json: {leaders: leagueLeaders, standings: leagueStandings}

    end
end
