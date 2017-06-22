class CreateJoinTableDisciplineNotebook < ActiveRecord::Migration[5.0]
  def change
    create_join_table :disciplines, :notebooks do |t|
      # t.index [:discipline_id, :notebook_id]
      # t.index [:notebook_id, :discipline_id]
    end
  end
end
