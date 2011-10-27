require 'spec_helper'

describe 'Canteen' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/' do
    it 'returns JSON' do
      get '/'
      last_response.content_type.should match('json')
    end
  end
end
