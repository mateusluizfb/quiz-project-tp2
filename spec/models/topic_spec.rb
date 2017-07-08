require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:quizzes) }
  it { should belong_to(:discipline) }

  it { should accept_nested_attributes_for(:quizzes) }

  it { should validate_presence_of(:name) }
end
