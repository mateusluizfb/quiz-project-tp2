require 'rails_helper'

RSpec.describe Team, type: :model do
  it "is invalid without name" do
    team = Team.new
    expect(team).not_to be_valid
  end
end
