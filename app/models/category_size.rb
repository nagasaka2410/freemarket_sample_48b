class CategorySize < ApplicationRecord
  belongs_to :products_size , optional: true
  belongs_to :category , optional: true
end
