class SecondScraping

  def initialize
    mechanize = Mechanize.new
    @page = mechanize.get('http://localhost:3000/works/second_scraping')
  end

  def get_list
    @page.search('div div').each do |page|
      puts page.inner_text
    end
  end

end
