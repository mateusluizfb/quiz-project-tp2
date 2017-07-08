FactoryGirl.define do
  factory :question do
    statement Faker::Hacker.say_something_smart
    quiz
  end
end
