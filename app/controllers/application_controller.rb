require './config/environment'
require './app/models/restaurant'
require './app/models/review'
require './app/models/user'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    set :session_secret, ENV['SESSION_SECRET']
    enable :sessions
  end

  get "/" do
    erb :"landing/home"
  end

  not_found do
    "Your page cannot be found"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def authorized?
      current_user.id == review.user_id
    end

  end 
end 

