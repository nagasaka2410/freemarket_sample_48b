class Product < ApplicationRecord
has_many :product_commets,dependent: :destroy
has_many :images
belongs_to :user
belongs_to :category
belongs_to :brand

enum status: {
  sell: 0, sold: 1, soldout: 2
}, _prefix: true
# sell 出品中、sold 売れた、soldout 売れて消える
end
