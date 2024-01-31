require 'rails_helper'

RSpec.describe "Files", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/files/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/files/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/files/update"
      expect(response).to have_http_status(:success)
    end
  end

end
