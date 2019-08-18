class Image < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :name, ImageUploader
  validates :name, presence: true
end