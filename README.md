# テーブル設計

## users テーブル

| カラム名            | 型      | バリデーション|
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| katakana-name      | string | null: false |
| birth day          |  date  | null: false |

### アソシエーション

- has_many :itens
- has_many :orders

## items テーブル

| カラム名             | 型          | バリデーション|
| ------             | ------    | ----------- |
|image               |  text     |null: false                    |
| product_name       | text      | null: false                   |
| Description        | text      | null: false                   |
| Category           | string    | null: false                   |
| item_condition     | string    | null: false                   |
|shipping_fee_payer  |string     |null: false                    |
|shipping_area       |string     |null: false                    |
|shipping_days       |string     |null: false                    |
|price               |decimal    |null: false                    |
|user                |references |null: false, foreign_key: true |


### アソシエーション

- has_many :orders
- belongs :user

## orders テーブル

| カラム名   | 型         | バリデーション                   |
| -------  | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :item
- belongs_to :user
-has_one:address

## address テーブル

| カラム名   | 型         | バリデーション                   |
|order      | references | null: false, foreign_key: true |

### アソシエーション

-belongs_to :order