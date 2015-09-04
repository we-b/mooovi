class TopController < ReviewController

  def index
    @products = [] # productテーブルから最新順に作品データを20件取り出す
  end

  def search
    # productsテーブルからキーワードで検索した作品データを20件取り出し、@products変数に入れる処理を書いて下さい
    @products = []
  end

  def entry
    @product = Product.find(entry_params[:id])
  end

  def post
    # top_controller.rbのpostアクションでデータを受け取り、データベースに保存する処理を書いて下さい
    # トップページにリダイレクトする処理を書いて下さい
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
