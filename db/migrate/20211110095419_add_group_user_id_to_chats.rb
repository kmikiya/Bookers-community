class AddGroupUserIdToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :group_user_id, :integer
  end
end
