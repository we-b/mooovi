class TopController < ReviewController
  before_action :authenticate_user!, only:[:search, :entry]
  
  def index
    @products = Product.order('id DESC').limit(20)
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
end
