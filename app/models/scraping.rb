class Scraping
  def self.movie_urls
    agent = Mechanize.new
    links = []
    next_url= "/now/"

    while true
      current_page = agent.get("http://eiga.com" + next_url)
      elements = current_page.search('.m_unit h3 a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      next_link = current_page.at('.next_page')
      next_url = next_link.get_attribute('href')

      break unless next_url
    end
    links.each do |link|
      get_product('http://eiga.com' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.moveInfoBox h1').inner_text
    image_url = page.at('.pictBox img')[:src] if page.at('.pictBox img')
    director = page.at('.f span').inner_text if page.at('.f span')
    detail = page.at('.outline p').inner_text
    open_date = page.at('.opn_date strong').inner_text if page.at('.opn_date strong')

    product = Product.where(title: title, image_url: image_url).first_or_initialize
    product.director = director
    product.detail = detail
    product.open_date = open_date
    product.save
  end
end