require 'rack/test'
FactoryBot.define do 
    factory :user do 
        name { Faker::Internet.unique.username }
        email { Faker::Internet.unique.email}
        password { Faker::Internet.unique.password(min_length: 8) }
    end

    factory :task do 
        title { Faker::Lorem.sentence }
        details { Faker::Lorem.paragraph }
        status { %w[pending in_progress completed] }
    end

    factory :attachment do 
        association :user

        title { Faker::Lorem.sentence }
        body { Faker::Lorem.paragraph }
        file {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'uploads', 'example.pdf')), 'application/pdf')}
    end
end