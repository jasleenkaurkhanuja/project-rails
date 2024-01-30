require 'rails_helper'

RSpec.describe 'Tasks', type: :request do 
    describe 'PATCH / update/:id' do 
        let!(:my_task) {FactoryBot.create(:task)}
            before do 
            patch "/tasks/#{my_task.id}", params:
            {
                task:
                {
                    title: my_task.title,
                    details: my_task.details,
                    status: my_task.status
                }
            }
        end
        it 'return the correct status' do 
            expect(json['status']).to eq(my_task.status)
        end
        it 'return the correct title' do 
            expect(json['title']).to eq(my_task.title)
        end
        it 'return the correct details' do 
            expect(json['details']).to eq(my_task.details)
        end
        it 'returns an ok status' do 
            expect(response).to have_http_status(:ok)
        end
    end
end