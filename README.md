# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first-name | string | null: false |
| last-name  | string | null: false |
| first-kana | string | null: false |
| last-kana  | string | null: false |
| birth-day  | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| image     | string | null: false |
| item-name | string | null: false |
| comment   | text   | null: false |
| price     | integer | null: false |

### Association

- belongs_to :user
- has_one :purchases
- has_one :deliveries
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :ship-origin
- belongs_to_active_hash :ship-day


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user-id   | references | null: false, foreign_key: true |
| item-id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :deliveries

## deliveries テーブル

| Column      | Type   | Options     |
| -------     | ------ | ----------- |
| postal-code | string |             |
| city        | string | null: false |
| block-num   | string | null: false |
| building    | string |             |
| phone       | string | null: false |

### Association

- belongs_to :purchase
- belongs_to :item
- belongs_to_active_hash :prefectures

# active_hash
--------------------
## categories

## statuses

## burdens

## ship-origins

## ship-days

## prefectures

