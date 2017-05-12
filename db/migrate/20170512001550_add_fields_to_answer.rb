class AddFieldsToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :text, :string
    add_column :answers, :correct_option, :boolean
  end
end
