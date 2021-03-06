## usersテーブル
|Column|Type|option|
|------|----|------|
|nickname|string|null:false, unique: true|
|email|string|null: false, unique: true|
|password|string|null:false|
|profile|text| ------ |
|icon|string| ----- |

### Associatiton
- has_one :user_detail
- has_one :user_address
- has_many :creditcards
- has_many :products_commets
- has_many :products
- has_many :likes



## User_detailsテーブル
|Column|Type|option|
|------|----|------|
|user|references|null:false,foreign_key: true|
|last_name|string|null:false|
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|mobile_phone|string|null:false|

### Associatiton
- belongs_to :user



## user_addressesテーブル
|Column|Type|option|
|------|----|------|
|user|references|null:false,foreign_key: true|
|prefecture|references|null:false,foreign_key: true|
|postal_code|integer|null:false|
|city|string|null:false|
|block_number|string|null:false|
|building|string|--------|
|telephone|string|--------|

### Associatiton
- belongs_to :user
- belongs_to :prefecture



## creditcardsテーブル
|Column|Type|option|
|------|----|------|
|user|references|null:false,foreign_key: true|
|account_holder|string|null:false|
|card_number|string|null:false|
|valid_month|integer|null:false|
|valid_year|integer|null:false|
|security_code|string|null:false|

### Associatiton
- belongs_to :user



## productsテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:false|
|desicription|text|null:false|
|seller_id|references|null:false,foreign_key: true|
|buyer_id|references|null:false|
|status|string|null:false|
|price|integer|null:false|
|category|references|null:false,foreign_key: true|
|condition|string|null:false|
|brand|references|null:false,foreign_key: true|
|product_size|string|--------|
|shipping_method|string|null:false|
|shipping_burden|string|null:false|
|prefecture|references|null:false,foreign_key: true|
|user|references|null:false|

###Associatiton
- has_many :products_commets,dependent: :destroy
- has_many :likes
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## likesテーブル
|Column|Type|option|
|------|----|------|
|product|references|null:false,foreign_key: true|
|user|references|null:false,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## products_commetsテーブル
|Column|Type|option|
|------|----|------|
|comment|text|--------|
|user|references|null:false,foreign_key: true|
|product|references|null:false,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## imagesテーブル
|Column|Type|option|
|------|----|------|
|name|string|null: false|
|product|references|null:false,foreign_key: true|

### Associatiton
- belongs_to :product




## categoriesテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:false|
|ancestory|string|null:false|

### Associatiton
- has_many :products




## brandsテーブル
|Column|Type|option|
|------|----|------|
|name|string|null:false|

## Associatiton
- has_many :products

## prefecturesテーブル
|Column|Type|option|
|------|----|------|
|prefecture|string|null:false|

## Associatiton
- has_many :user_addresses
