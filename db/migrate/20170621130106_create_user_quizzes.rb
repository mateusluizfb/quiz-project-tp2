class CreateUserQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_quizzes do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.string :score

      t.timestamps
    end
  end
end
