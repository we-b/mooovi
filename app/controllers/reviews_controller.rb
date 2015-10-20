class ReviewsController < RankingController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    # Review.create(create_params)
    # トップページにリダイレクトする
  end

  private
  def create_params
  end
end
