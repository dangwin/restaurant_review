require 'pry'
class SessionsController < ApplicationController

        get '/signup' do
            erb :'/session/signup'
        end

        post '/signup' do
            @user = User.new(username: params["name"], password: params["password"])
             @user.save
                session[:user_id] = @user.id
           redirect '/users/user_home'
            
    end 

        get '/login' do 
            erb :'/session/login'
        end

        post '/login' do
            @user = User.find_by(username: params[:username], password: params[:password])
            if @user 
                session[user_id] = @user.id 
                redirect '/users/user_home'
            else 
                erb :"/session/error"
        end
    end


end
