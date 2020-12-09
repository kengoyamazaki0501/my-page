FactoryBot.define do
  factory :user do
    name                  { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { 'a1a1a1a1' }
    password_confirmation { password }
  end
end
