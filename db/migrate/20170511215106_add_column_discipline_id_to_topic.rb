class AddColumnDisciplineIdToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :discipline_id, :integer
  end
end
