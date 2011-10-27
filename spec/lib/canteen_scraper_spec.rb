require 'spec_helper'

describe CanteenScraper do
  describe '.meals' do
    let(:todays_meals) {}
    let(:tomorrows_meals) {}

    it 'returns meals for today' do
      subject.meals.should == todays_meals
    end

    it 'returns meals for a given date' do
      subject.meals_for('2011-10-28').should == tomorrows_meals
    end
  end
end
