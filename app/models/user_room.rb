class UserRoom < ApplicationRecord
   belongs_to :group_user
  belongs_to :room
end
