class Product < ApplicationRecord
has_many :product_commets,dependent: :destroy
has_many :images
belongs_to :user
belongs_to :category
belongs_to :brand
end
