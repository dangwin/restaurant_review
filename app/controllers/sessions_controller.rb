require 'pry'
class SessionsController < ApplicationController

        get '/signup' do
            erb :'/session/signup'
        end

        post '/signup' do
            user = User.new(:username => params[:username], :password => params[:password])
           if user.save
                session[:user_id] = user.id
            
                redirect "/login"
           else
            erb :"/session/error"
           end 
            
         end 

        get '/login' do 
            erb :'/session/login'
        end

        post '/login' do
            user = User.find_by(:username => params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                erb :"/users/user_home"
            else 
                erb :'/session/error'
             end
         end 


        get '/logout' do
        session.clear
        redirect '/'
        end 

        get '/users/user_home' do 
            if !logged_in?
                redirect "/login"
            else 
                @user = current_user
                erb :"/users/user_home"
            end 
        end

    
        
end
