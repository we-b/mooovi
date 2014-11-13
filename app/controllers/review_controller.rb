class ReviewController < ApplicationController
  layout 'review_site'

    
  before_action :auth, :configure_ranking

  private

  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'tcamp' && pass == 'master'
    end
  end

  def configure_ranking
  	ids = Review.limit(5).group(:product_id).order('count_product_id DESC').count(:product_id).keys
  	sanitized_query = ActiveRecord::Base.send(:sanitize_sql_array, ["field(id ,?)", ids])
  	@ranking = Product.where(:id => ids).order(sanitized_query)
  end
end
