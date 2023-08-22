## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| id                 | integer| null: false, unique: true |
| nicname            | string | null: false |
| email              | string | null: false |
| password           | text   | null: false |
| username_kanji     | text   | null: false |
| username_kana      | text   | null: false |
| birthdate          | text   | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :orders


## Items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| id                 | integer| null: false, unique: true |
| image_url          | string | null: false, unique: true |
| name               | string | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shipping_fee       | string | null: false |
| shipping_region    | string | null: false |
| shipping_days      | string | null: false |
| price              | integer| null: false |

### Association

- belongs_to :user
- belongs_to :address

## Addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| id                 | integer    | null: false, unique: true |
| card_number        | string     | null: false |
| expiration_date    | text       | null: false |
| security_code      | text       | null: false |
| postal_code        | text       | null: false |
| prefecture         | text       | null: false |
| city               | text       | null: false |
| street_address     | text       | null: false |
| building_name      | text       | null: false |
| phone_number       | integer    | null: false |

### Association

- belongs_to :user
- has_many :items

## Orders テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| id              | integer | null: false, unique: true |
| user_id         | integer | null: false               |
| item_id         | integer | null: false               |

- belongs_to :user