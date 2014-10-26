class FirstScraping

  def initialize
    mechanize = Mechanize.new
    @page = mechanize.get('http://localhost:3000/works/first_scraping')
  end

  def get_list
    @page.search('li').each do |page|
      puts page.inner_text
    end
  end

end
