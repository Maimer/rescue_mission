class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    remove_column :questions, :description
    add_column :questions, :description, :text, null: false
    remove_column :answers, :description
    add_column :answers, :description, :text, null: false
  end
end
