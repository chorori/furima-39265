## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthdate          | date   | null: false |

### Association

- has_many :items
- has_many :order


## Items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_id    | integer | null: false |
| shipping_region_id | integer | null: false |
| shipping_day_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :orders


## Addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| shipping_region_id | integer    | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| order              | references | null: false, foreign_key: true|


### Association

- belongs_to :order


## Orders テーブル

| Column          | Type      | Options                   |
| --------------- | -------   | ------------------------- |
| user            | reference | null: false, foreign_key: true|
| item            | reference | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address