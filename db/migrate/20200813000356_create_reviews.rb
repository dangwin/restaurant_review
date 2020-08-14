class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.string :user_id
      t.string :restaurant_id

  end
end 
end 