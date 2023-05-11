# テーブル設計

## users テーブル

| カラム名            | 型      | バリデーション             |
| ------------------ | ------ | -----------              |
| nickname           | string | null: false              |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kane     | string | null: false              |
| birth day          |  date  | null: false              |

### アソシエーション

- has_many :itens
- has_many :orders

## items テーブル

| カラム名               | 型         | バリデーション                  |
| ------                | ------    | -----------                   |
| product_name          | string    | null: false                   |
| description           | text      | null: false                   |
| genre_id              | integer   | null: false                   |
| item_condition_id     | integer   | null: false                   |
|shipping_fee_payer_id  |integer    |null: false                    |
|shipping_area_id       |integer    |null: false                    |
|shipping_days_id       |integer    |null: false                    |
|price                  |integer    |null: false                    |
|user                   |references |null: false, foreign_key: true |


### アソシエーション

- has_many :orders
- belongs_to :user

## orders テーブル

| カラム名   | 型         | バリデーション                   |
| -------  | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :item
- belongs_to :user
-has_one:address

## addresses テーブル

| カラム名       | 型          | バリデーション                   |
| ------        | ------     | -----------                    |
|order          | references | null: false, foreign_key: true |
|post_code      |integer     |null: false                     |
|prefectures_id |integer     |null: false                     |
|municipalities | string     | null: false                    |
|block_number   | string     | null: false                    |
|building_name  | string     |                                |
|phone_number   | string     | null: false                    |

### アソシエーション

-belongs_to :order