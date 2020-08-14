require './config/environment'
require './app/models/restaurant'
require './app/models/review'
require './app/models/user'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :"landing/home"
  end


end
