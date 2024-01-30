require 'rails_helper'

def json 
    JSON.parse(response.body)
end

RSpec.describe "User", type: :request do
    describe 'post/register' do 
        context "with valid parameters" do
            let!(:my_user) {FactoryBot.build(:user)}
                before do 
                    post '/user/register', params:
                    {
                        user:
                        {
                            name: my_user.name,
                            email: my_user.email,
                            password: my_user.password
                        }
                    }
                end
                it 'returns a correct name' do 
                    expect(json['name']).to eq(my_user.name)
                end
                
                it 'returns a correct email' do 
                    expect(json['email']).to eq(my_user.email)
                end
                it 'returns correct status' do 
                    expect(response).to have_http_status(:created)
                end

            end
        end
end
