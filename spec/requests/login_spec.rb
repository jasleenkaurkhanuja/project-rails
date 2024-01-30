require 'rails_helper'

def json 
    JSON.parse(response.body)
end

RSpec.describe "User", type: :request do 
    describe 'post/login' do 
        context "with valid parameters" do
        let(:my_user) {FactoryBot.create(:user)}
        before do 
            post '/user/login', params:
            {
                user:
                {
                    email: my_user.email,
                    password: my_user.password
                }
            }
        end
        # byebug
        it 'returns a correct email' do 
            expect(json['user']['email']).to eq(my_user.email)
        end

        it 'returns a token' do 
            expect(json['token']).to be_present 
        end

        it 'returns an ok status' do 
            expect(response).to have_http_status(:ok)
        end
    end 
    end
end