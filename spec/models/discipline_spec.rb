require 'rails_helper'

RSpec.describe Discipline, type: :model do
  it { should have_many(:topics) }
  it { should have_and_belong_to_many(:notebooks) }

  it { should accept_nested_attributes_for(:topics) }

  it { should validate_presence_of(:name) }
end
