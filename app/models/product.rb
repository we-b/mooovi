class Product < ActiveRecord::Base
  has_many :reviews

  def average_rate
    reviews.present? ? reviews.average(:rate).round : ''
  end
end
