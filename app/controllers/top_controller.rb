class TopController < ReviewController

  def index
    @products = [] # productテーブルから最新順に作品データを20件取り出す
  end

  def search
    # productsテーブルからキーワードで検索した作品データを20件取り出し、@products変数に入れる処理を書いて下さい
    @products = []
  end

  private
  def search_params
    params.permit(:keyword)
  end
end
