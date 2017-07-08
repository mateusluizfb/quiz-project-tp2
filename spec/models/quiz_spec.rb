require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should belong_to(:topic) }
  it { should have_many(:questions) }

  it { should accept_nested_attributes_for(:questions) }

  it { should validate_presence_of(:name) }

  it "evaluates correctly" do
    user = create(:user)
    quiz = create(:quiz)
    answer_hash = {}

    5.times do
      question = create(:question, quiz: quiz)

      3.times do |i|
        answer = create(:answer)

        if i == 1
          answer.update_attribute(:correct_option, true)
          answer_hash[question.id] = answer.id
        else
          answer.update_attribute(:correct_option, false)
        end

        question.answers << answer
      end
    end

    response = quiz.evaluate(answer_hash, user)

    expect(response[:grade]).to eq(5)
  end
end
