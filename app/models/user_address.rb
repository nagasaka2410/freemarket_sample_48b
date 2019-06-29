class UserAddress < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :prefecture
end
