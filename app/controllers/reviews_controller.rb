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
    # product_id = params[:product_id]
    # params.require(:review).permit(:rate, :review, :product_id).merge(product_id: product_id, user_id: current_user.id)
  end
end
