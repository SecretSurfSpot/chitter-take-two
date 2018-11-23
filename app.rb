require 'sinatra/base'
require './app/model/peep'
require './app/model/database'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.view_all_peeps
    erb :peeps
  end

  get '/add_new_peep' do
    'Add a peep'
     erb :add_new_peep
  end

  post '/save_peep' do
    Peep.create_new_peep(content: params[:peep])
    redirect '/peeps'
  end



  configure do
      set :views, Proc.new { File.join(root, "app/views") }
      enable :sessions
  end

end
