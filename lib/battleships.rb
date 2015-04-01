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
    @board_p1 = Board.new({ size: 4, cell: Cell })
    @water = Water.new
    # cell = Cell.new
    @board_p1.fill_all_content(@water)
    @something = @board_p1.grid.map { |row| row.map { |cell| cell } }
    puts '---' * 10
    puts @board_p1
    puts @something
    @name = session['player_1_name']
    @message = "Sup #{@name}!"
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
