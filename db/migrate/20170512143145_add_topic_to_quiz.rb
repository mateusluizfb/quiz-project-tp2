class AddTopicToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_reference :quizzes, :topic, foreign_key: true
  end
end
