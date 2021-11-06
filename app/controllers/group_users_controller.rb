class GroupUsersController < ApplicationController

    def create
        #group = Group.find(params[:group_id])
        group_user = GroupUser.new
        group_user.group_id = params[:group_id]
        group_user.user_id = current_user.id
        group_user.save
        #redirect_to groups_path
        redirect_to request.referer
    end

    def destroy
        group = Group.find(params[:group_id])
        group_user = group.group_users.find_by(user_id: current_user.id)#謎
        group_user.destroy
       # redirect_to groups_path
       redirect_to request.referer
    end
end
