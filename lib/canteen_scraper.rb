module CanteenScraper
  url = "http://macmillan.autograph-foodservice.co.uk/page.php?menu"

  def self.meals
    today = Time.now

    page = Net::HTTP.get(URI.parse(url))
    html = Nokogiri.parse(page)

    table = html.at('table')
    meals = {}
    (table/'th').each do |header|
      date = header.match(/(\d{2}\/\d{2}\/\d{4})/)[1]
    end
  end
end
