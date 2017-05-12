require 'rails_helper'

RSpec.describe Topic, type: :model do
  it "is invalid without name" do
    topic = Topic.new
    expect(topic).not_to be_valid
  end

  it "belongs to a discipline" do
    topic = Topic.new(name: 'new topic')
    topic.save

    discipline = Discipline.new(name: 'new discipline')
    discipline.save

    topic.discipline = discipline
    topic.save

    expect(topic.discipline).to eq(discipline)
  end

  it "has many quizzes" do
    topic = Topic.new(name: 'topic with quizzes')
    topic.save

    quiz_1 = Quiz.create(name: 'quiz 1')
    quiz_2 = Quiz.create(name: 'quiz 2')

    topic.quizzes << quiz_1
    topic.quizzes << quiz_2

    expect(topic.quizzes.count).to eq(2)
  end
end
