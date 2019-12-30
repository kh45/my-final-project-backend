Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :leagues
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login' => 'users#login'
  post '/addLeague' => 'users#addLeague'
  post '/NBAHome' => 'leagues#NBAHome'
  post '/addPlayer' => 'users#followPlayer'
  post '/players/:id' => 'players#profile'
  post '/user/home' => 'users#home'

  post '/NFLHome' => 'leagues#NFLHome'
  get 'NBAteams' => 'teams#NBATeams'

end
