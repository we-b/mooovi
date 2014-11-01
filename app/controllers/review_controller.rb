class ReviewController < ApplicationController
  layout 'review_site'

  before_action :auth

  private

  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'tcamp' && pass == 'master'
    end
  end
end
