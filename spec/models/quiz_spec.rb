require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should belong_to(:topic) }
  it { should have_many(:questions) }

  it { should accept_nested_attributes_for(:questions) }

  it { should validate_presence_of(:name) }
end
