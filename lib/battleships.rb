require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'game'
require_relative 'player'

class BattleShips < Sinatra::Base
  enable :sessions

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    @name = session['player_1_name']
    'Hello BattleShips!'
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    @name = params[:Name]

    if @name.empty?
      @message = 'Please enter name'
      erb :new_game
    else
      @message = "Sup #{@name}!"
      session['player_1_name'] = @name
      erb :start_game
    end
  end

  get '/start_game' do
    session['player_2_name'] = 'CPU'
    @name = session['player_1_name']
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
