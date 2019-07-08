class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_detail
  has_one :user_address
  has_one :creditcard

  validates :nickname, presence: true

  accepts_nested_attributes_for :user_address, :user_detail, :creditcard
end
