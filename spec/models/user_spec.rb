require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:notebook) }
  it { should have_and_belong_to_many(:teams) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:password) }

  it "create notebook when user created" do
    expect(create(:user).notebook).not_to be_nil
  end
end
