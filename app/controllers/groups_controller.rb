class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    @group.save
    redirect_to groups_path, notice: "You have created book successfully."
  end

  def index
    @groups = Group.includes(:users, :group_users).all
    @book = Book.new
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
    @group_users = GroupUser.where(group_id: @group.id)
    #@userid = @group_users.user_id
    #@users = User.where(params[@userid])
  end

 def edit
   @group = Group.find(params[:id])
   unless @group.owner_id == current_user.id
     redirect_to groups_path
   end
 end

 def update
   @group = Group.update(group_params)
   redirect_to groups_path, notice: "You have created book successfully."
 end

 def new_mail
    @group = Group.find(params[:group_id])
 end

  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content,group_users).deliver#contact_mailerで定義したsend_mailはここで使われる
  end

  def group_exist(user)
    Group.where(user_id: user.id).exists?
  end

  private
  def group_params
     params.require(:group).permit(:name, :introduction, :image)
  end
end
