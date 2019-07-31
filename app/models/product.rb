class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
has_many :product_commets,dependent: :destroy
has_many :images
accepts_nested_attributes_for :images
belongs_to :user
belongs_to :category
belongs_to :brand, foreign_key: "brand_id", optional: true
end
