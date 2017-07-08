require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }

  it { should accept_nested_attributes_for(:answers) }

  it { should validate_presence_of(:statement) }

  it "update score to 1 if it is nil" do
    expect(create(:question).score).not_to be_nil
  end
end
