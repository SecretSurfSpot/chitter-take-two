require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

end
