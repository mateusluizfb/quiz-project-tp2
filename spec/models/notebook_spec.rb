require 'rails_helper'

RSpec.describe Notebook, type: :model do

  let(:user) {
    User.create!(
      name: 'Fulano',
      login: 'fulano123',
      email: 'email@email.com',
      password: '123456',
    )
  }

  let(:valid_attributes) {
    {
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    {
      user_id: nil
    }
  }

  it 'Is valid with valid attributes' do
    notebook = Notebook.new valid_attributes
    expect(notebook).to be_valid
  end

  it 'Is invalid with invalid attributes' do
    notebook = Notebook.new invalid_attributes
    expect(notebook).to_not be_valid
  end


end
