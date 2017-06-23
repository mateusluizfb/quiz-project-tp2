require 'rails_helper'

RSpec.describe Discipline, type: :model do
  it "is invalid without name" do
    discipline = Discipline.new
    expect(discipline).not_to be_valid
  end

  it "belongs to many notebooks" do
    discipline = Discipline.new(name: 'new discipline')
    discipline.save

    user1 = User.create(name: 'user 1', login: 'user 1', email: 'user1@example.com', password: 'user123')
    user2 = User.create(name: 'user 2', login: 'user 2', email: 'user2@example.com', password: 'user123')
  
    user1.notebook.disciplines << discipline
    user2.notebook.disciplines << discipline

    expect(discipline.notebooks.count).to eq(2)
  end
end
