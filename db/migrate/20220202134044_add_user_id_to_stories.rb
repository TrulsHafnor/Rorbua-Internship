class AddUserIdToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :user_id, :integer
    add_index :stories, :user_id
  end
end
