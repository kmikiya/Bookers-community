class RemoveUserIdFromChat < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :user_id, :integer
  end
end
