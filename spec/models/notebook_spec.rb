require 'rails_helper'

RSpec.describe Notebook, type: :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:disciplines) }
end
