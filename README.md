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
| birth-day  | date   | null: false |

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
| category-id    | integer | null: false |
| status-id      | integer | null: false |
| burden-id      | integer | null: false |
| ship-origin-id | integer | null: false |
| ship-day-id    | integer | null: false |

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
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :deliveries

## deliveries テーブル

| Column       | Type   | Options     |
| -------      | ------ | ----------- |
| postal-code  | string | null: false |
| city         | string | null: false |
| block-num    | string | null: false |
| building     | string |             |
| phone        | string | null: false |
| prefecture-id | string | null: false |

### Association

- belongs_to :purchase
- belongs_to :item
- belongs_to_active_hash :prefecture

# active_hash
--------------------
## categories

## statuses

## burdens

## ship-origins

## ship-days

## prefectures

