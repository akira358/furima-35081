# テーブル設計

## usersテーブル

|| Column           | Type   | Options    |
| ------------------| ------ | ----------- |
| name              | string | null: false |
| email             | string | unique:true |
| encrypted_password| string | null: false |
|last_name          | string | null: false |
|first_name         | string | null:false  |
|last_name_kana     | string | null: false |
|first_name_kana    | string | null: false |
|date               | string | null :false |




### Association
- has_many :items
- has_many :orders

## items テーブル

| Column               | Type     | Options                     |
|----------------------| ---------| ----------------------------|
|text                  | string   | null: false                 |
|category              | text     | null:false                  |
|price                 | integer  | null:false                  |
|info                  | string   | null: false                 |
|genre_id              |integer   | null: false                 |
|user                  |references| null:false, foreign_key: true|

### Association
- belongs_to :user
- has_one :orders

## orders テーブル

| Column   |     Type   | Options     |
| -------- | ---------- | ----------- |
| users    | references | null: false |
| items    | references | null: false |

### Association
- belongs_to :item
- has_one :addresses
- belongs_to :user

## addresses テーブル

 Column         | Type   | Options     |
| --------------| ------ | ----------- |
| postal code   | string | null: false |
|prefecture code| string | null: false |
|city           | string | null: false |
|street         | string | null: false |
|other address  | string | null: false | 


### Association
- belongs_to :order