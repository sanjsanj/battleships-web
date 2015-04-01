require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'game'
require_relative 'player'
require_relative 'water'
require_relative 'ship'

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
      session['player_1_name'] = @name
      session['player_2_name'] = 'CPU'
      redirect :start_game
    end
  end

  get '/start_game' do
    # @cell = Cell.new.content("")
    board_p1 = Board.new({ size: 100, cell: Cell })
    board_p1.fill_all_content(Water.new)
    board_p1.place Ship.new(size: 1), :A1
    board_p1.place Ship.new(size: 1), :C3
    board_p1.place Ship.new(size: 1), :D4
    board_p1.place Ship.new(size: 1), :J10
    @something = board_p1.grid.values.map { |cell| cell.content.class }.each_slice(Math.sqrt(board_p1.size)).to_a
    @name = session['player_1_name']
    @message = "Sup #{@name}!"
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
