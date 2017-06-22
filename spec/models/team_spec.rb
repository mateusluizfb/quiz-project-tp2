require 'rails_helper'

RSpec.describe Team, type: :model do

  let(:valid_attributes) { { name: 'Sadboys' } }

  let(:invalid_attributes) { { name: nil } }


  it 'Is valid with valid attributes' do
    team = Team.new valid_attributes
    expect(team).to be_valid
  end

  it 'Is invalid with invalid attributes' do
    team = Team.new invalid_attributes
    expect(team).to_not be_valid
  end

end
