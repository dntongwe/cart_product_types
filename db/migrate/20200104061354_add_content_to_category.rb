class AddContentToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :content, :text
  end
end
