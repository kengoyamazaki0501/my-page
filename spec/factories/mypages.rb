FactoryBot.define do
  factory :mypage do

    title            {"test"}
    catch_copy      {"test"}
    concept          {"test"}
    
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
