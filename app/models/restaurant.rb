require 'pry'
class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    # binding.pry

end 