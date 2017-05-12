require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without login" do
    user = User.new(name: 'user', email: 'user@example.com', password: 'user123')
    expect(user).not_to be_valid
  end

  it "is invalid without name" do
    user = User.new(login: 'user', email: 'user@example.com', password: 'user123')
    expect(user).not_to be_valid
  end

  it "is invalid without email" do
    user = User.new(name: 'user', login: 'user', password: 'user123')
    expect(user).not_to be_valid
  end

  it "is invalid without password" do
    user = User.new(name: 'user', login: 'user', email: 'user@example.com')
    expect(user).not_to be_valid
  end
end
