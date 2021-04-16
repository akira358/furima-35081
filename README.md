# テーブル設計

## usersテーブル

|| Column           | Type   | Options    |
| ------------------| ------ | ----------- |
| name              | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
|last_name          | string | null: false |
|first_name         | string | null:false  |
|last_name_kana     | string | null: false |
|first_name_kana    | string | null: false |
|birth_date         | date   | null :false |




### Association
- has_many :items
- has_many :orders

## items テーブル

| Column               | Type     | Options                     |
|----------------------| ---------| ----------------------------|
|name                  | text     | null: false                 |
|text                  | string   | null: false                 |
|category              | text     | null:false                  |
|info                  | string   | null: false                 |
|shipping_fee_status_id|integer   | null: false                 |
|prefecture_id         |integer   | null: false                 |
|schedule_id           |integer   |null: false                  |
|user                  |references| null:false, foreign_key: true|
|price                 | integer  | null:false                  |

### Association
- belongs_to :user
- has_one :orders

## orders テーブル

| Column  |     Type   | Options     |
| --------| ---------- | ----------- |
| user    | references | null: false |
| item    | references | null: false |

### Association
- belongs_to :item
- has_one :address
- belongs_to :user

## addresses テーブル

 Column         | Type      | Options     |
| --------------| --------- | ----------- |
|postal_code    | string    | null: false |
|prefecture_id  | integer   | null: false |
|city_id        | integer   | null: false |
|street         | string    | null: false |
|build          | string    |             | 
|phone_number   | string    | null: false |
|orders_id      | references|null:false, foreign_key: true|

### Association
- belongs_to :order