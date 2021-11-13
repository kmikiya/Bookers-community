class ChatsController < ApplicationController
  def show
  @group_user = GroupUser.find_by(params[:group_id])
  @group_members = GroupUser.where(params[:group_id])
  @group = Group.find(params[:group_id])
  rooms = @group.user_rooms.pluck(:room_id)
  user_rooms = UserRoom.find_by(group_id: @group_user.id, room_id: rooms)

  if user_rooms.nil?
   @room = Room.new
   @room.save
     @group_members.each do |member|
       UserRoom.create(group_user_id: member.id, room_id: @room.id, group_id: @group)
     end
   #UserRoom.create(user_id: current_user.id, room_id: @room.id)
  else
   @room = user_rooms.room
  end

  @chats = @room.chats
  @chat = Chat.new(room_id: @room.id)
  end

  def create
  @group = Group.find(user_id: current_user.id)
  @chat = @group.chats.new(chat_params)#ここの@groupに入る変数の意味を理解する必要がある.
  @chat.save

  redirect_to request.referer
 end

 private

 def chat_params
  params.require(:chat).permit(:message, :room_id)
 end

end
