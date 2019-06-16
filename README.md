## userテーブル
|Column|Type|option|
|------|----|------|
|nickname|string|null:falls, unique: true|
|email|string|null: false, unique: true|
|password|string|null:falls|
|profile|text| ------ |
|icon|text| ----- |

### Associatiton
- has_one :user_detail
- has_one :user_addresses
- has_many :card
- has_many :products_commets
- has_many :products,through: :products_commets
- has_many :likes



## User_detailsテーブル
|Column|Type|option|
|------|----|------|
|user_id|references|null:falls,foreign_key: true|
|last_name|string|null:falls|
|first_name|string|null:falls|
|first_name_kana|string|null:falls|
|last_name_kana|string|null:falls|
|birth_year|integer|null:falls|
|birth_month|integer|null:falls|
|birth_day|integer|null:falls|
|telephone|integer|null:falls|

### Associatiton
- belongs_to :user



## user_addressesテーブル
|Column|Type|option|
|------|----|------|
|user_id|references|null:falls,foreign_key: true|
|prefecture_id|references|null:falls,foreign_key: true|
|postal_code|integer|null:falls|
|city|string|null:falls|
|block_number|integer|null:falls|
|building|string|--------|

### Associatiton
- belongs_to :user



## creditcardテーブル
|Column|Type|option|
|------|----|------|
|user_id|references|null:falls,foreign_key: true|
|account_holder|string|null:falls|
|valid_month|integer|null:falls|
|valid_day|integer|null:falls|
|security_code|integer|null:falls|

### Associatiton
- belongs_to :user



## productsテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:falls|
|desicription|text|null:falls|
|seller_id|references|null:falls,foreign_key: true|
|buyer_id|references|null:falls|
|status|string|null:falls|
|price|integer|null:falls|
|category_id|references|null:falls,foreign_key: true|
|condition|string|null:falls|
|brands_id|references|null:falls,foreign_key: true|
|product_size|string|--------|
|shipping_method|string|null:falls|
|shipping_burden|integer|null:falls|
|prefecture_id|references|null:falls,foreign_key: true|
|user_id|references|null:falls|

###Associatiton
- has_many :products_commets
- has_many :likes
- has_many :images
- has_many :users through: :products_commets
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## likesテーブル
|Column|Type|option|
|------|----|------|
|products_id|references|null:falls,foreign_key: true|
|user_id|references|null:falls,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## products_commetsテーブル
|Column|Type|option|
|------|----|------|
|comment|text|--------|
|user_id|references|null:falls,foreign_key: true|
|products_id|references|null:falls,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## imagesテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:falls|
|products_id|references|null:falls,foreign_key: true|

### Associatiton
- belongs_to :product




## categoriesテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:falls|
|ancestory|string|null:falls|

### Associatiton
- has_many :products




## brandsテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:falls|

## Associatiton
- has_many :products
