class EigaCom
  DOMAIN = 'http://eiga.com/'

  def initialize
    mechanize = Mechanize.new
    @page = mechanize.get("#{DOMAIN}now")
  end

  def get_link
    @page.search('.m_unit h3 a').each do |anchor|
      product_page = Mechanize.new.get("#{DOMAIN}#{anchor[:href]}")
      product_page.search('.moveInfoBox').each do |product|
        title = product.at('h1').inner_text
        image_url = product.at('img.main')[:src]
        Product.create!(title: title, image_url: image_url)
      end
    end
  end
end