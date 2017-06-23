require 'rails_helper'

RSpec.describe Quiz, type: :model do

  let(:valid_attributes) {
    {
      name: 'Quiz da computação'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  it 'Is valid with valid attributes' do
    quiz = Quiz.new valid_attributes
    expect(quiz).to be_valid
  end

  it 'Is invalid with invalid attributes' do
    quiz = Quiz.new invalid_attributes
    expect(quiz).to_not be_valid
  end
end
