class AddReferenceToTopics < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :quiz, foreign_key: true
  end
end
