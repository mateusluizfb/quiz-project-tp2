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

  it "belongs to many teams" do
    user = User.new(name: 'user', login: 'user', email: 'user@example.com', password: 'user123')
    user.save

    team_1 = Team.create(name: 'team 1')
    team_2 = Team.create(name: 'team 2')

    user.teams << team_1
    user.teams << team_2

    user.save

    expect(user.teams.count).to eq(2)
  end

  it 'creates a notebook for user' do
    user = User.new(name: 'user', login: 'user', email: 'user@example.com', password: 'user123')
    user.create_notebook

    expect(user.notebook).to be_a(Notebook)
  end
end
