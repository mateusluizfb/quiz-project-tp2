class AddColumnToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :topic_id, :integer
  end
end
