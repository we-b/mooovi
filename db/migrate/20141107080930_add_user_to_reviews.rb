class AddUserToReviews < ActiveRecord::Migration
  def change
  	add_reference :reviews, :user
  end
end
