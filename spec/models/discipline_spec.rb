require 'rails_helper'

RSpec.describe Discipline, type: :model do
  it "is invalid without name" do
    discipline = Discipline.new
    expect(discipline).not_to be_valid
  end
end
