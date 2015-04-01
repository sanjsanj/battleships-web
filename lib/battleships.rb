require 'sinatra/base'

class BattleShips < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    'Hello BattleShips!'
    erb :index
  end

  get '/new_game'  do
    erb :new_game
  end

  post '/new_game' do
    @name = params[:Name]

    if @name.empty?
      @message = 'Please enter name'
      erb :new_game
    else
      @message = "Sup #{@name}!"
      erb :new_game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
