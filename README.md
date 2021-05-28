# テーブル設計

## users テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| nickname           | string      | null: false                    |
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| last_name          | string      | null: false                    |
| first_name         | string      | null: false                    |
| kana_last_name     | string      | null: false                    |
| kana_first_name    | string      | null: false                    |
| birthday           | date        | null: false                    |

### Association
-has_many   :items
-has_many   :purchases

## items テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| item_name          | string      | null: false                    |
| description        | text        | null: false                    |
| category           | integer     | null: false                    |
| condition          | integer     | null: false                    |
| shipping_charge    | integer     | null: false                    |
| shipping_area      | integer     | null: false                    |
| day_to_ship        | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
-belongs_to : user
-has_one    : purchase

## purchases テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association
-has_one    :shipping_address
-belongs_to :user
-belongs_to :items

## Shipping_Addresses テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| postal_code        | string      | null: false                    |
| prefecture         | integer     | null: false                    | 
| municipality       | string      | null: false                    |
| house-number       | string      | null: false                    |
| building_name      | string      |                                |
| phone_number       | string      | null: false                    |
| purchase           | references  | null: false, foreign_key: true |

### Association 
-belongs_to :purchase