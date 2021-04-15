# テーブル設計

## usersテーブル

|| Column       | Type   | Options    |
| --------------| ------ | ----------- |
| name          | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
|last-name      | string | null: false |
|first-name     | string | null:false  |
|last-name-kana | string | null: false |
|first-name-kana| string | null: false |
|birth_date_1i  | string | null :false |
|birth_date_2i  | string | null :false |
|birth_date_3i  | string | null :false |



### Association
- has_many :items
- has_many :orders

## items テーブル

| Column     | Type   | Options                     |
|------------| ------ | ----------------------------|
|text        | string | null: false                 |
|category    | text   | null:false                  |
|price       | integer| null:false                  |
|info        | string | null: false                 |
|sales-status|string  | null: false
|scheduled-delivery|string| null: false
| user_id|references| null:false,   foreign_key: true|

### Association
- belongs_to :user
- has_one :orders

## orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| users    | string | null: false |
| items    | string | null: false |

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