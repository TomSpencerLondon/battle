require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session.delete(:attack)
    #Game has singleton like behaviour (but we can init with params)
    Game.create_new_game(params[:name_1], params[:name_2])
    session[:next_turn] = 2
    redirect '/play'
  end

  get '/play' do
    @message = session[:attack]
    @p1_name = Game.instance.player_1.name
    @p2_name = Game.instance.player_2.name
    @p1_hp = Game.instance.player_1.hp
    @p2_hp = Game.instance.player_2.hp
    erb(:play)
  end

  get '/gameover' do
    @winner = (Game.instance.player_1.hp == 0 ? game.instance.player_2.name : Game.instance.player_1.name)
    erb(:gameover)
  end

  post '/attack' do
    params[:attack] == Game.instance.player_1.name ? Game.instance.attack(Game.instance.player_1) : Game.instance.attack(Game.instance.player_2)
    redirect '/gameover' if Game.instance.game_over
    session[:attack] = "#{params[:attack]} has been attacked!"
    session[:next_turn] = (Game.instance.current_turn == Game.instance.player_1 ? 2 : 1)
    redirect '/play'
  end




  #Start the server if ruby file executed directly
  run! if app_file == $0
end
