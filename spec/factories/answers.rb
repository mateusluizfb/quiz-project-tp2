FactoryGirl.define do
  factory :answer do
    text Faker::Hacker.say_something_smart
    correct_option Faker::Boolean.boolean
    question    
  end
end
