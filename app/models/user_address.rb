class UserAddress < ApplicationRecord
  belongs_to :user, optional: true
  accepts_nested_attributes_for :user

  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block_number, presence: true
end
