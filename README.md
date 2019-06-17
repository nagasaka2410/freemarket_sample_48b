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
- has_many :cards
- has_many :products_commets
- has_many :products,through: :products_commets
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
|telephone|integer|null:false|

### Associatiton
- belongs_to :user



## user_addressesテーブル
|Column|Type|option|
|------|----|------|
|user|references|null:false,foreign_key: true|
|prefecture|references|null:false,foreign_key: true|
|postal_code|integer|null:false|
|city|string|null:false|
|block_number|integer|null:false|
|building|string|--------|

### Associatiton
- belongs_to :user



## creditcardsテーブル
|Column|Type|option|
|------|----|------|
|user|references|null:false,foreign_key: true|
|account_holder|string|null:false|
|valid_month|integer|null:false|
|valid_day|integer|null:false|
|security_code|integer|null:false|

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
|brands|references|null:false,foreign_key: true|
|product_size|string|--------|
|shipping_method|string|null:false|
|shipping_burden|integer|null:false|
|prefecture|references|null:false,foreign_key: true|
|user_id|references|null:false|

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
|products|references|null:false,foreign_key: true|
|user|references|null:false,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## products_commetsテーブル
|Column|Type|option|
|------|----|------|
|comment|text|--------|
|user|references|null:false,foreign_key: true|
|products|references|null:false,foreign_key: true|

### Associatiton
- belongs_to :user
- belongs_to :product



## imagesテーブル
|Column|Type|option|
|------|----|------|
|name|string|null: false|
|products|references|null:false,foreign_key: true|

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
