class UserAddress < ApplicationRecord
  belongs_to :user, optional: true

  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city,:block_number, presence: true
  validates :block_number, presence: true
end
