class ReviewController < ApplicationController
  layout 'review_site'

  def new
    @product = Product.find(params[:id])
  end

  def create
    # reviews_controller.rbのcreateアクションでデータを受け取り、データベースに保存する処理を書いて下さい
    # トップページにリダイレクトする処理を書いて下さい
  end

  private
  def review_params
    params.require(:review).permit(:nickname, :product_id, :rate, :review)
  end
end
