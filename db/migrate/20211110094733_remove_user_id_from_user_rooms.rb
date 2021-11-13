class RemoveUserIdFromUserRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_rooms, :user_id, :integer
  end
end
