# テーブル設計

## users テーブル

| Column                   | Type     | Options                   |
| ------------------------ | -------- | ------------------------- |
| kanji_first_name         | string   | null: false               |
| kanji_last_name          | string   | null: false               |
| kana_first_name          | string   | null: false               |
| kana_last_name           | string   | null: false               |
| email                    | string   | null: false, unique: true |
| encrypted_password       | string   | null: false               |
| birth_date               | date     | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| explanation             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| status_id               | integer    | null: false                    |
| burden_id               | integer    | null: false                    |
| region_id               | integer    | null: false                    |
| day_id                  | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item                    | references | null: false, foreign_key: true |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address_number   | string     | null: false                    |
| region_id        | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     | 
| phone_number     | string     | null: false                    |

### Association

- belongs_to :order
