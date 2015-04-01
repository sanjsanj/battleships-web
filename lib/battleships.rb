require 'sinatra/base'

class BattleShips < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    'Hello BattleShips!'
    erb :index
  end

  get('/new_game') do erb :new_game
  end

  post '/new_game' do
    @name = params[:Name]

    # if @name is empty redirect the player to same thing again, but this time send a message as well
    # else welcome the player

    if @name.empty?
      @message = 'Dont forget to enter your name'
      erb :new_game
    else
      "Welcome #{@name}"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
