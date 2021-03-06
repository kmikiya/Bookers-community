class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
end
