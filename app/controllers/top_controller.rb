class TopController < ApplicationController
  layout 'review_site'

  before_action :set_ranking

  def index
    @reviews = Review.order('id DESC').limit(8)
    @products = Product.order('id DESC').limit(6)
  end

  def search
    @products = search_params[:keyword] ? Product.where('title LIKE(?)', "%#{search_params[:keyword]}%") : []
  end

  def entry
    @product = Product.find(entry_params[:id])
  end

  def post
    Review.create!(create_params)
    redirect_to action: :index
  end

  private
  def search_params
    params.permit(:keyword)
  end

  def entry_params
    params.permit(:id)
  end

  def create_params
    params.permit(:nickname, :product_id, :rate, :review)
  end

  private
  def set_ranking
    @ranking = ReviewRank.new(5).get
  end
end
