# テーブル設計

## users テーブル

| Column                   | Type     | Options                   |
| ------------------------ | -------- | ------------------------- |
| first_name               | string   | null: false               |
| last_name                | string   | null: false               |
| email                    | string   | null: false, unique: true |
| password                 | string   | null: false               |
| confirmed_password       | string   | null: false               |
| birth_date               | datetime | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| explanation             | text       | null: false                    |
| category                | string     | null: false                    |
| status                  | string     | null: false                    |
| burden                  | string     | null: false                    |
| region                  | string     | null: false                    |
| days                    | string     | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders


## orders テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| card_number             | integer    | null: false                    |
| card_expiration         | datetime   | null: false                    |
| card_code               | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address_number   | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street           | integer    | null: false                    |
| building         | string     | null: false                    |
| phone_number     | integer    | null: false, foreign_key: true |

### Association

- belongs_to :order
