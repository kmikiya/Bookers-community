class RemoveGroupUserIdFromChat < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :group_user_id, :integer
  end
end
