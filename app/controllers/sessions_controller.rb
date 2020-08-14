class SessionsController < ApplicationController

        get '/signup' do
            erb :'/session/signup'
        end

        post '/signup' do
            user = User.new(username: params[:username], password: params[:password])
            if user.save
                redirect "/login"
            else 
                erb :"/session/error"
            end
    end 
end
