require 'spec_helper'

describe CanteenScraper do
  before do
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, Regexp.new(CanteenScraper::URL + "&week=2011-10-27"), :body => File.read('spec/fixtures/menu.html'))
  end

  describe '.meals' do
    let(:todays_meals) {{:main=>"Baked Vienna Steak served with Onion Sauce", :veggie=>"Stir Fry Chinese Vegetables in a Blackbean Sauce"}}
    let(:tomorrows_meals) {}

    it 'returns meals for today' do
      Timecop.freeze(2011, 10, 27) do
        subject.meals.should == todays_meals
      end
    end

    it 'returns meals for a given date' do
      Timecop.freeze(2011, 10, 27) do
        one_day = 60 * 60 * 24
        subject.meals_for(Time.now + one_day).should == tomorrows_meals
      end
    end
  end
end
