require 'rails_helper'

RSpec.describe "Tasks", type: :request do 
    describe "get / tasks" do 
        
        before do 
            FactoryBot.create_list(:task, 10)
            get '/tasks'
        end
        it 'returns all posts' do 
            expect(json.size).to eq(10)
        end
        it 'returns success http code' do 
            expect(response).to have_http_status(:success)
        end
    end
end