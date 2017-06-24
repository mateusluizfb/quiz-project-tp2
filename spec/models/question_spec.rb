require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:quiz) { Quiz.create! name: 'Matemática' }

  let(:valid_attributes) {
    {
      statement: 'Quanto é 2 + 2?',
      score: 10,
      quiz_id: quiz.id
    }
  }

  let(:invalid_attributes) {
    {
      statement: nil,
      score: nil,
      quiz_id: nil
    }
  }

  it 'Is valid with valid attributes' do
    question = Question.new valid_attributes
    expect(question).to be_valid
  end

  it 'Is invalid with valid attributes' do
    question = Question.new invalid_attributes
    expect(question).to_not be_valid
  end

end
