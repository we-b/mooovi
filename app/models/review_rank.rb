class ReviewRank
  def initialize(size)
    @size = size
  end

  def get
    rank = Review.select('COUNT(*) as count').group(:product_id).order('count_all DESC').count
    Product.where(id: rank.keys).limit(@size)
  end
end