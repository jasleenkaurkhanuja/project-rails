require 'rails_helper'
require 'faker'

def json 
  JSON.parse(response.body)
end

RSpec.describe "weather", type: :request do
  describe "GET /weather/:city" do
    # let(:city) {Faker::Address.city}
    before do 
      # puts random_city
      get "/weather/indore"
    end
    # byebug
    it 'returns correct city' do 
      expect(json['name']).to eq("Indore")
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end

