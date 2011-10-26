require 'sinatra'
require 'json'
require 'lib/canteen_scraper'

get '/' do
  meals = CanteenScraper.meals
  content_type :json
  {
    :main => 'Lamb',
    :veggie => 'Flan'
  }.to_json
end
