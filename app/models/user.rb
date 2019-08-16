class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_detail
  has_one :user_address
  has_one :creditcard
  has_many :products
  validates :nickname, presence: true

 # userが「買った商品 :buyed_products」「現在売っている商品 :saling_items」「すでに売った商品 :sold_items」
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "user_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Product"

  accepts_nested_attributes_for :user_address, :user_detail, :creditcard
end
