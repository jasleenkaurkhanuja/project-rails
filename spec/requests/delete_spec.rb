require 'rails_helper'

RSpec.describe "Tasks", type: :request do 
    describe 'DELETE / delete' do 
        let!(:task) {FactoryBot.create(:task)}
        before do 
            delete "/tasks/#{task.id}"
        end

        it 'returns status code of 200' do 
            expect(response).to have_http_status(200)
        end
    end
end