# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'nokogiri'
require 'open-uri'
require 'watir'
# require 'headless'
# require 'watir-nokogiri'
# require 'webdrivers'

# league = RestClient.get('http://api.sportradar.us/nba/trial/v7/en/league/hierarchy.json?api_key=dnc8cebrxtcamyu4ew4n8pw3')

# league_array = JSON.parse(league)["conferences"]

# league_array.each do |conference|
#     conference["divisions"].each do |division|
#         division["teams"].each do |team|
#             Team.create(
#                 name: team["name"],
#                 market: team["market"],
#                 alias: team["alias"],
#                 sportradarRef: team["id"],
#                 NBARef: team["reference"]
#             )
#         end
#     end
# end


# url1 = 'http://api.sportradar.us/nba/trial/v7/en/teams/'
# url2= '/profile.json?api_key=dnc8cebrxtcamyu4ew4n8pw3'

# team = Team.all[29]
    
# raw_team = RestClient.get("#{url1}#{team.sportradarRef}#{url2}")
# fresh_team = JSON.parse(raw_team)
# fresh_team["players"].each do |player|
#     Player.create(
#         full_name: player["full_name"],
#         sportradarRef: player["id"],
#         first_name: player["first_name"],
#         last_name: player["last_name"],
#         height: player["height"],
#         weight: player["weight"],
#         position: player["position"],
#         primary_position: player["primary_position"],
#         jersey_number: player["jersey_number"],
#         experience: player["experience"],
#         college: player["college"],
#         high_school: player["high_school"],
#         birthdate: player["birthdate"],
#         NBARef: player["reference"],
#         teamRef: fresh_team["id"],
#         team_id: team.id 

#     )
# end


# players = Player.all
# base_url = 'https://www.nba.com/players'
# players.each do |player|
#     Player.update(player.id, :headshot => "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/#{player["NBARef"]}.png")
# end

# def wow(players, base_url)
#     byebug
# end

# # wow(players, base_url)

# html = open("https://www.nba.com/players/Jalen/McDaniels/1629667")
# doc = Nokogiri::HTML(html)

# def wow(doc)
#     html = open("https://www.nba.com/players/Jalen/McDaniels/1629667")
#     doc = Nokogiri::HTML(html)
# #     src = doc.css(".nba-player-header__headshot")[0].children[0].attr('src') 
# #     byebug
# #     src.split('//')[1]
# # end

# # wow()

# # Player.update(85, :headshot => nil)

# def wow()
#     html = open("/Users/flatironschool/Desktop/Rotoworld fantasy sports news and analysis for NFL, MLB, NBA, NHL, CFB, Golf, EPL and NASCAR.htm")
#     doc = Nokogiri::HTML(html)
#     result = doc.css(".dialog-off-canvas-main-canvas").css("#main").css(".page-wrapper--sidebar").css(".content").css("#block-mainpagecontent-2").css(".block__content").css('#depth-chart-page-wrapper').css('.depth-chart-list').css('a')
#     array_of_ids = []
#     result.each do |res|
#         player = {name: "#{res.attr('href').split('/')[7].split('-')[0].capitalize} #{res.attr('href').split('/')[7].split('-')[1].capitalize}", id: res.attr('href').split('/')[6]}
#         array_of_ids.push(player)
#         # puts res.attr()
#     end
#     db_players = Player.all
#     db_players.each do |player|
#         # puts player["full_name"]
#         # byebug
#         found = array_of_ids.find {|scrape| scrape[:name] == "#{player["first_name"].capitalize} #{player["last_name"].capitalize}"}
#         if found
#             Player.update(player.id, :rotoRef => found[:id])
#         end
#         puts found
#     end
#     # byebug
# end

# browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
#     browser.driver.manage.timeouts.implicit_wait = 100 

# def scrape
#     # browser = Watir::Browser.new
#     browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
#     browser.driver.manage.timeouts.implicit_wait = 100 
#     browser.goto('https://www.rotoworld.com/basketball/nba/player/30576/trae-young/news')
#     js_doc = browser.element(css: ".player-news__list").wait_until(&:present?)
#     new_doc = Nokogiri::HTML(js_doc.inner_html)
#     titles = new_doc.css('.player-news-article__title') 
#     news = new_doc.css('.player-news-article__summary')
#     byebug
#     browser.close
# end


# scrape()
# def wow()
#     html = open("https://www.rotoworld.com/basketball/nba/teams/atl/atlanta-hawks/depth-chart")
#     doc = Nokogiri::HTML(html)
#     result = doc.css('.dialog-off-canvas-main-canvas').css('#main').css('.page-wrapper--sidebar').css('.content').css('.block-mainpagecontent-2').css('.block__content').css('#team-entity').css('.team-content__container')
#     byebug
# end

# User.create(name: 'John', username: 'jdoe', password: 'thegame', email: 'khaledhassan45@gmail.com')

# def hello
#     playa = User.find_by(name: 'Khaled')
#     byebug
# end

# hello()
# Player.update(392, :rotoRef => '51498') #john konchar
# Player.update(389, :rotoRef => '30617') #de'anthony melton
# Player.update(384, :rotoRef => '30499') #pj dozier
# Player.update(380, :rotoRef => '30475') #vlatko cancar
# Player.update(358, :rotoRef => '52612') #moses brown
# Player.update(354, :rotoRef => '52618') #jaylen hoard
# Player.update(353, :rotoRef => '30624') #devon hall
# Player.update(352, :rotoRef => '30582') #shai gilg
# Player.update(345, :rotoRef => '30422') #justin patton
# Player.update(333, :rotoRef => '51294') #juwan morgan
# Player.update(329, :rotoRef => '51433') #justin wright-foreman
# Player.update(323, :rotoRef => '27782') #royce o'neale
# Player.update(322, :rotoRef => '30481') #nigel williams-goss
# Player.update(316, :rotoRef => '30619') #ykeita bates-diop
# Player.update(315, :rotoRef => '30157') #karl anthony towns
# Player.update(308, :rotoRef => '30235') #treveon graham
# Player.update(300, :rotoRef => '30460') #frank mason iii
# Player.update(297, :rotoRef => '30443') #dj wilson
# Player.update(288, :rotoRef => '30299') #dragan bender
# Player.update(283, :rotoRef => '30618') #svi myk
# Player.update(276, :rotoRef => '52639') #louis king
# Player.update(268, :rotoRef => '30278') #tj mcconnell
# Player.update(265, :rotoRef => '52611') #brian bowen ii
# Player.update(264, :rotoRef => '30444') #tj leaf
# Player.update(262, :rotoRef => '30527') #naz mitro-long
# Player.update(257, :rotoRef => '30051') #tj warren jr
# Player.update(238, :rotoRef => '52614') #tyler cook
# Player.update(235, :rotoRef => '56107') #max strus
# Player.update(214, :rotoRef => '30179') #rondae hollis-jeff
# Player.update(206, :rotoRef => '51036') #oshae brissett
# Player.update(188, :rotoRef => '55805') #vincent poirier
# Player.update(185, :rotoRef => '30426') #david nawba
# Player.update(170, :rotoRef => '30319') #timothe luwawu
# Player.update(167, :rotoRef => '29849') #kyle o quinn
# Player.update(150, :rotoRef => '30461') #ivan rabb
# Player.update(134, :rotoRef => '30533') #amile jefferson
# Player.update(133, :rotoRef => '48815') #bj johnson
# Player.update(129, :rotoRef => '29381') #dj augistin
# Player.update(128, :rotoRef => '30420') #josh magette
# Player.update(125, :rotoRef => '29581') #al farouq aminu
# Player.update(121, :rotoRef => '29928') #mcw
# Player.update(120, :rotoRef => '30459') #wes iwundu
# Player.update(116, :rotoRef => '27791') #daryl macon
# Player.update(114, :rotoRef => '51418') #chris silva
# Player.update(100, :rotoRef => '30355') #tyone wallace
# Player.update(99, :rotoRef => '30316') #deandre bembry
# Player.update(96, :rotoRef => '51340') #charles brown jr
# Player.update(94, :rotoRef => '51035') #deandre hunter
# Player.update(85, :rotoRef => '55940') #robert franks jr
# Player.update(84, :rotoRef => '29802') #mkg
# Player.update(80, :rotoRef => '30511') #kobi simmons
# Player.update(75, :rotoRef => '51046') #pj washing
# Player.update(74, :rotoRef => '30605') #devonte graham
# Player.update(72, :rotoRef => '56188') #caleb martin
# Player.update(69, :rotoRef => '51072') #jalen mcdaniles
# Player.update(59, :rotoRef => '29096') #cj miles jr


# UserLeague.destroy((20..38).to_a)
# UserLeague.destroy(45)
# def scrape
#     # browser = Watir::Browser.new
#     browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
#     browser.driver.manage.timeouts.implicit_wait = 100 
#     browser.goto('https://www.rotoworld.com/basketball/nba/player/29803/bradley-beal/news')
#     js_doc = browser.element(css: ".player-news__list").wait_until(&:present?)
#     new_doc = Nokogiri::HTML(js_doc.inner_html)
#     titles = new_doc.css('.player-news-article__title') 
#     news = new_doc.css('.player-news-article__summary')
#     byebug
#     browser.close
# end


# scrape()

# Team.update(30, :logo => 'https://upload.wikimedia.org/wikipedia/en/c/c7/SacramentoKings.svg')

# def assign
#     teams = Team.all
#     teams.each do |team|
#         Team.update(team.id, :league_id => 1)
#     end
# end

# update_logos()

# UserLeague.destroy(47)
# User.create(username: 'newuser', password: 'thegame', email: 'hello@gmail', name: 'New User')

# raw_team = RestClient.get("https://api.sportsdata.io/v3/nba/scores/json/teams?key=dd539433905f43c9a6f29230ac1f24d3")
# fresh_team = JSON.parse(raw_team)
# fresh_team.each do |team|
#     da_team = Team.find_by(name: team["Name"])
#     # puts da_team.name
#     Team.update(da_team.id,
#         :primaryColor => team['PrimaryColor'],
#         :secondaryColor => team['SecondaryColor'],
#         :tertiaryColor => team['TertiaryColor'],
#         :quaternaryColor => team['QuaternaryColor'])
#     end


# def nfl_seeding
#     nfl_teamsRAW = RestClient.get('http://api.sportradar.us/nfl/official/trial/v5/en/league/hierarchy.json?api_key=gxwenyjwghsgpusdmj8qs8t3')
#     nfl_teams = JSON.parse(nfl_teamsRAW)
#     afc = nfl_teams["conferences"][1]["divisions"]
#     afc.each do |div|
#         div["teams"].each do |team|
#             Team.create(name: team["name"], alias: team["alias"], market: team["market"], sportradarRef: team["id"], league_id: 3)
#         end
#     end
# end

# nfl_seeding()

# def nfl_seeding
#     # nfl = League.find(3)
#     # teams = nfl.teams
#     current_team = '768c92aa-75ff-4a43-bcc0-f2798c2e1724'
#     nfl_team = Team.find_by(sportradarRef: current_team)
#     nfl_teamsRAW = RestClient.get("https://api.sportradar.us/nfl/official/trial/v5/en/teams/#{current_team}/full_roster.json?api_key=gxwenyjwghsgpusdmj8qs8t3")
#     nfl_roster = JSON.parse(nfl_teamsRAW)
#     nfl_roster["players"].each do |player|
#         Player.create(sportradarRef: player["id"], full_name: player["name"], first_name: player["first_name"], last_name: player["last_name"], height: player["height"], weight: player["weight"], position: player["position"], jersey_number: player["jersey"], college: player["college"], birthdate: player["birth_date"], teamRef: current_team, team_id: nfl_team.id)
#     end
# end

# nfl_seeding()

    # teams.each do |team|
    #     nfl_teamsRAW = RestClient.get("https://api.sportradar.us/nfl/official/trial/v5/en/teams/#{team.sportradarRef}/full_roster.json?api_key=gxwenyjwghsgpusdmj8qs8t3")
    #     nfl_roster = JSON.parse(nfl_teamsRAW)
    #     nfl_roster["players"].each do |player|

#     nfl_teams = JSON.parse(nfl_teamsRAW)
#     afc = nfl_teams["conferences"][1]["divisions"]
#     afc.each do |div|
#         div["teams"].each do |team|
#             Team.create(name: team["name"], alias: team["alias"], market: team["market"], sportradarRef: team["id"], league_id: 3)
#         end
#     end
# end

# nfl_seeding()

# def team_logos
#     nfl = League.find(3)
#     nfl.teams.each do |team|
#         team.players.each do |player|
#             Player.update(player.id, :headshot => 'https://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/2576623.png&w=350&h=254')
#         end
#     end
# end

# team_logos()

# def espn
#     html = open("https://www.espn.com/nfl/team/depth/_/name/oak")
#     doc = Nokogiri::HTML(html).css('a')
#     players = []
#     doc.each do |link|
#         # byebug
#         if link.attr("href") != nil && link.attr('href').include?('http://www.espn.com/nfl/player')
#             players.push(link)
#         end
#     end
#     players.each do |player|
#         # byebug
#         full_name = player.attr('href').split('/')[-1].split('-')
#         espn_id = player.attr('href').split('/')[7]
#         first_name = full_name[0].capitalize()
#         last_name = full_name[1].capitalize()

#         team_idd = 46

#         if Player.where(first_name: first_name, last_name: last_name, team_id: team_idd).length > 0
#             guy = Player.where(first_name: first_name, last_name: last_name, team_id: team_idd)
#             Player.update(guy[0].id, :headshot => "https://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/#{espn_id}.png&w=350&h=254")
#             # byebug
#         else
#             puts full_name
#         end
#         # puts full_name
#     end
# end

# espn()

def starter
    player = Player.where(first_name: 'Isaiah', last_name: 'McKenzie')
    Player.update(player[0].id, :headshot => 'https://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/3128724.png&w=350&h=254')
    # byebug
end

# starter()

# def titans
#     da_id = '386bdbf9-9eea-4869-bb9a-274b0bc66e80'
#     team_raw = RestClient.get("https://api.sportradar.us/nfl/official/trial/v5/en/teams/#{da_id}/full_roster.json?api_key=gxwenyjwghsgpusdmj8qs8t3")
#     team = JSON.parse(team_raw)
#     team["players"].each do |player|
#         Player.create(sportradarRef: player["id"], full_name: player["name"], first_name: player["first_name"], last_name: player["last_name"], height: player["height"], weight: player["weight"], position: player["position"], jersey_number: player["jersey"], college: player["college"], birthdate: player["birth_date"], teamRef: da_id, team_id: 48)
#     end

# end

# titans()