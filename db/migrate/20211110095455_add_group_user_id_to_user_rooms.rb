class AddGroupUserIdToUserRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :user_rooms, :group_user_id, :integer
  end
end
