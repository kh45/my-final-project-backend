class PlayersController < ApplicationController

    def index
        players = Player.all
        render json: players.to_json(:include => :team, :except => [:updated_at])
    end

    def NBAPlayers
        players = []
        nba = League.find(1)
        nba.teams.each do |team|
            players.push(team.players)
        end
        render json: players.flatten.to_json(:include => :team, :except => [:updated_at])
    end

    def NFLPlayers
        players = []
        nfl = League.find(3)
        nfl.teams.each do |team|
            players.push(team.players)
        end
        render json: players.flatten.to_json(:include => :team, :except => [:updated_at])
    end

    def profile
        player = Player.find_by(sportradarRef: params[:id])
        # new_player = player.includes(:team)

        if params[:league] == 'NBA'
            playerStats_raw = RestClient.get("http://api.sportradar.us/nba/trial/v7/en/players/#{params[:id]}/profile.json?api_key=cgp756j3uygfn3kqzcbj8xex")
            playerStats = JSON.parse(playerStats_raw)

            articles = []
            if params[:myOrigin] === 'profile'
                browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
                browser.driver.manage.timeouts.implicit_wait = 100 
                browser.goto("https://www.rotoworld.com/basketball/nba/player/#{player["rotoRef"]}/#{player["first_name"]}-#{player["last_name"]}/news")
                js_doc = browser.element(css: ".player-news__list").wait_until(&:present?)
                new_doc = Nokogiri::HTML(js_doc.inner_html)
                titles = new_doc.css('.player-news-article__title') 
                news = new_doc.css('.player-news-article__summary')
                num_of_articles = titles.length
                num_of_articles.times do |i|
                    articles.push({body: news[i].text, headline: titles[i].text})
                end
                browser.close
                render json: {player: player.as_json(:include => :team), articles: articles, stats: playerStats}
            end
        end
        # byebug
            if params[:league] == 'NFL'
                if params[:myOrigin] === 'profile'
                    # byebug
                    render json: {player: player.as_json(:include => :team), articles: articles} #make same as nba above
                end
            end

            if params[:myOrigin] === 'modal'
                render json: {player: player, stats: playerStats}
            end
    end
end