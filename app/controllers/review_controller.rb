require 'pry'
class ReviewController < ApplicationController


    get '/reviews' do 
        @user = current_user
        @reviews = @user.reviews
        erb :'/reviews/index'   
    end 

    get '/reviews/new' do 
        @restaurants = Restaurant.all
        erb :'/reviews/new'
    end 

    post '/reviews' do
        @review = current_user.reviews.build(params)
        if @review.save
            redirect '/reviews'
        else
            erb :'reviews/new'
        end 
    
    end 

    get '/reviews/:id/edit' do
        get_review
      
        if @review.user == current_user
            erb :'reviews/edit'
        else
            redirect '/reviews'
        end 
    end 

    patch '/reviews/:id' do
        get_review
        if @review.user == current_user 
            if @review.update(text: params[:text]) 
                redirect '/reviews'
            else
                erb :'reviews/edit'
            end
        end 
    end 

    delete '/reviews/:id' do
        get_review
        if @review.user == current_user
            @review.delete
        end
        redirect '/reviews'
    end 



    def get_review
        @review = Review.find_by_id(params[:id])
    end

end 


        
        
    

