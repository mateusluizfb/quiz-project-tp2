require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:valid_attributes) {
    {
      text: 'Letra a',
      correct_option: true
    }
  }

  let(:invalid_attributes) {
    {
      text: nil,
      correct_option: nil
    }
  }

  it 'Is valid with valid attributes' do
      answer = Answer.new valid_attributes
      byebug
      expect(answer).to be_valid
  end

  it 'Is invalid with valid attributes' do
    answer = Answer.new invalid_attributes
    expect(answer).to_not be_valid
  end
end
