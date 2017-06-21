require 'rails_helper'

RSpec.describe UserQuiz, type: :model do

  it 'Create valid Quiz' do
    quiz = Quiz.create! id: 1, name: 'Quanto é 1 + 1?'
    expect(quiz.id).to eq(1)
  end

  it 'Quiz is invalid with invalid attributes' do
    quiz = Quiz.new
    expect(quiz).not_to be_valid
  end

end
