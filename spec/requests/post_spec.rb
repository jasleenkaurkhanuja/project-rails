require 'rails_helper'

def json
    JSON.parse(response.body)
end
RSpec.describe 'Tasks', type: :request do 
    describe 'POST / tasks' do 
        context 'with valid parameters' do 
            let!(:my_task) { FactoryBot.create(:task) }
            before do 
                post '/tasks', params:
                {
                    task:{
                        title: my_task.title,
                        details: my_task.details,
                        status: my_task.status
                    }
                }
            end
            it 'returns the title' do 
                expect(json['title']).to eq(my_task.title)
            end
            it 'returns the details' do 
                expect(json['details']).to eq(my_task.details)
            end
            it 'returns the status' do 
                expect(json['status']).to eq(my_task.status)
            end
            it 'returns the created status' do 
                expect(response).to have_http_status(:created)
            end
        end
        # context 'with invalid parameters' do 
        #     before do 
        #         post '/api/v1/posts', params:
        #         {
        #             post:{
        #                 title:'',
        #                 content:''
        #             }
        #         }
        #     end
        #     it 'returns unprocessable entity status' do 
        #         expect(response).to have_http_status(:unprocessable_entity)
        #     end
        # end
    end
end