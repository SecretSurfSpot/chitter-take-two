require 'sinatra/base'
require './app/model/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/add_new_peep' do
    'Add a peep'
     erb :add_new_peep
  end



  configure do
      set :views, Proc.new { File.join(root, "app/views") }
      enable :sessions
  end

end
