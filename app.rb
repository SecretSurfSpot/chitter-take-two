require 'sinatra/base'
require './app/model/peep'

class Chitter < Sinatra::Base


  get '/' do
    'Welcome to Chitter'
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'

  end



  configure do
      set :views, Proc.new { File.join(root, "app/views") }
      enable :sessions
  end

end
