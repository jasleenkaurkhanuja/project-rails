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
end