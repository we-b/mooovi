class ReviewController < ApplicationController
  layout 'review_site'

  before_action :auth, :set_ranking

  private
  def set_ranking
    @ranking = ReviewRank.new(5).get
  end

  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'tcamp' && pass == 'master'
    end
  end
end
