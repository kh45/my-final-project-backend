class PlayersController < ApplicationController

    def index
        players = Player.all
        render json: players.to_json(:include => :team, :except => [:updated_at])
    end

    def show
        player = Player.find_by(NBARef: params[:id])
    browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
    browser.driver.manage.timeouts.implicit_wait = 100 
    browser.goto("https://www.rotoworld.com/basketball/nba/player/#{player["rotoRef"]}/#{player["first_name"]}-#{player["last_name"]}/news")
    js_doc = browser.element(css: ".player-news__list").wait_until(&:present?)
    new_doc = Nokogiri::HTML(js_doc.inner_html)
    titles = new_doc.css('.player-news-article__title') 
    news = new_doc.css('.player-news-article__summary')
    # byebug
    articles = []
    # headlines = []
    num_of_articles = titles.length
    num_of_articles.times do |i|
        articles.push({body: news[i].text, headline: titles[i].text})
    end

    # news.each do |item|
    #     articles.push(item.text)
    # end
    # titles.each do |item|
    #     headlines.push(item.text)
    # end
    browser.close

    render json: {player: player, articles: articles}
    end


end
