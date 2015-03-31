require 'sinatra/base'

class BattleShips < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    'Hello BattleShips!'
    erb :index
  end

get '/' do
  "Hello World"
end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    @name = params[:Name]
    erb :new_game
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
