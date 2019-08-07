class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # delegate :name, to: :prefecture
  has_many :product_commets,dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user
  belongs_to :category
  belongs_to :products_size, foreign_key: "size_id", optional: true
  belongs_to :brand, foreign_key: "brand_id", optional: true
  enum status: {
    sell: 0, sold: 1, soldout: 2
  }, _prefix: true
  # sell 出品中、sold 売れた、soldout 売れて消える

  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end
 
  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end
end
