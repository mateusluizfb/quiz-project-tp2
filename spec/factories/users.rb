FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    login Faker::Internet.user_name
    password Faker::Internet.password(6)
  end
end
