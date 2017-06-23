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
  
  it 'Is valid with valid attributes' do
    notebook = Notebook.new valid_attributes
    expect(notebook).to be_valid
  end
end
