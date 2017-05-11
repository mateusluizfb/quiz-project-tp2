class AddColumnToDiscipline < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplines, :discipline_id, :integer
  end
end
