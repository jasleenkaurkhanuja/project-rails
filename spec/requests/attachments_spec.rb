require 'rails_helper'
require 'jwt'



###########    FUNCTIONS     ######################



def json 
  JSON.parse(response.body)
end

SECRET_KEY = Rails.application.secret_key_base
def generate_jwt_token (user)
    JWT.encode({user_id: user.id}, SECRET_KEY)
end


########################################################################################################




RSpec.describe "Attachment", type: :request do
  describe "GET /attachments" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:attachment) { FactoryBot.create_list(:attachment, 10, user:user)}
    let!(:headers) { { "Authorization" => "Bearer #{generate_jwt_token(user)}"} }
    before do 
        get "/attachments", headers:headers
    end
    it "returns correct number of attachments" do
      expect(json.size).to eq(10)
    end
  end


##############################################################################################################
  


  describe "POST /create" do
    let!(:user) {FactoryBot.create(:user) }
    let!(:token) {generate_jwt_token(user)}
    let!(:attachment) { FactoryBot.create(:attachment) }
    before do 
      post '/user/login', params:
      {
        user:
        {
          name: user.name,
          email: user.email,
          password:user.password
        }
      }

      token = json['token']

      post '/attachments', headers: { "Authorization" => "Bearer #{token}"} , params:
      {
          title:attachment.title,
          body: attachment.body,
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'uploads', 'example.pdf')), 'application/pdf')
      }
    end

    it "returns the correct title" do
      expect(json['title']).to eq(attachment.title)
    end
    it "returns the correct body" do
      expect(json['body']).to eq(attachment.body)
    end
    it "returns the correct status" do
      expect(response).to have_http_status(:created)
    end
  end


##################################################################################################################



  describe "DELETE /destroy" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:token) { generate_jwt_token(user)}
    let!(:attachment) {FactoryBot.create(:attachment, user:user)}
    before do 
      # post '/user/login', params: 
      # {
      #   user:
      #   {
      #     email:user.email,
      #     password:user.password
      #   }
      # }
      # token = json['token']

      # post '/attachments', params: 
      # {
      #   title: attachment.title,
      #   body: attachment.body,
      #   file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'uploads', 'example.pdf')), 'application/pdf')
      # }

    delete "/attachments/#{attachment.id}", headers: {"Authorization" => "Bearer #{token}"}
    end
    
    it "returns the correct status" do
      expect(response).to have_http_status(:ok)
    end
  end


  ###############################################################################################################



  
  describe "PATCH /update" do 
    let!(:user) { FactoryBot.create(:user) }
    let!(:token) {generate_jwt_token(user)}
    let!(:new_title) {'Updated title'}
    let!(:new_body) {'Updated body'}
    let!(:attachment) { FactoryBot.create(:attachment, user:user) }
    before do 
      post '/user/login', params: 
      {
        user:
        {
          name:user.name,
          email:user.email,
          password:user.password
        }
      }
      token = json['token']
      
      patch "/attachments/#{attachment.id}", headers:{ "Authorization" => "Bearer #{token}"}, params:
      {
        title:new_title,
        body:new_body,
        file:Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'uploads', 'example.pdf')), 'application/pdf')
      }
    end
    it "returns correct title" do 
      expect(json['title']).to eq(new_title)
    end
    it "returns correct body" do 
      expect(json['body']).to eq(new_body)
    end
  end

end
