class Group < ApplicationRecord
    has_many :group_users, dependent: :destroy
    has_many :users, through: :group_users
    has_many :user_rooms, through: :group_users
    attachment :image, destroy: false
end
