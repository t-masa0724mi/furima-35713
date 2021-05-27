# テーブル設計

## users テーブル

| Column          | Type        | Options                        |
|-----------------|-------------|--------------------------------|
| nickname        | string      | null: false                    |
| email           | string      | null: false                    |
| password        | string      | null: false                    |
| last_name       | string      | null: false                    |
| first_name      | string      | null: false                    |
| kana_last_name  | string      | null: false                    |
| kana_first_name | string      | null: false                    |
| birth_year      | string      | null: false                    |
| birth_month     | string      | null: false                    |
| birth_day       | string      | null: false                    |

### Association
-has_many   :items
-has_many   :purchases

## items テーブル

| Column          | Type        | Options                        |
|-----------------|-------------|--------------------------------|
| item_name       | string      | null: false                    |
| description     | text        | null: false                    |
| price           | integer     | null: false                    |
| user_id         | references  | null: false, foreign_key: true |

### Association
-belongs_to : user
-has_one    : purchase

## purchases テーブル

| Column          | Type        | Options                        |
|-----------------|-------------|--------------------------------|
| user_id         | references  | null: false, foreign_key: true |
| item_id         | references  | null: false, foreign_key: true |

### Association
-has_one    :shipping_address
-belongs_to :user
-belongs_to :items

## Shipping_Addresses テーブル

| Column          | Type        | Options                        |
|-----------------|-------------|--------------------------------|
| postal_code     | integer     | null: false                    |
| municipality    | string      | null: false                    |
| house-number    | integer     | null: false                    |
| building_name   | integer     |                                |
| phone_number    | integer     | null: false                    |
| purchase_id     | references  | null: false, foreign_key: true |

### Association 
-belongs_to :purchase