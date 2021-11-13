class Chat < ApplicationRecord
  belongs_to :group_user
  belongs_to :room
  #belongs_to :user, through: :group_users
end
