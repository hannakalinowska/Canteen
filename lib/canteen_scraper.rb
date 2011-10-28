module CanteenScraper
  URL = "http://macmillan.autograph-foodservice.co.uk/page.php?menu"

  def self.meals
    self.meals_for(Time.now)
  end

  def self.meals_for(date)
    date_for_url = date.strftime('%Y-%m-%d')
    page = Net::HTTP.get(URI.parse("#{URL}&week=#{date_for_url}"))
    html = Nokogiri.parse(page)

    table = html.at('table')
    a = []
    (table/'tr').each do |row|
      a << []
      (row/'th').each do |header|
        text = header.text.match(/(\d{2}\/\d{2}\/\d{4})/)[1]
        a.last << text
      end

      (row/'td').each do |cell|
        text = cell.text.gsub(/^(Veggie )?Main Course\s+/, '').gsub(/\r\n/, ' ')
        a.last << text
      end
    end
    index = a[0].index(date.strftime('%d/%m/%Y'))

    {
      :main => a[1][index],
      :veggie => a[3][index]
    }
  end
end
