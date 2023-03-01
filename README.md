# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last-name          | string | null: false               |
| first-name         | string | null: false               |
| last-name-kana     | string | null: false               |
| first-name-kana    | string | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-schedule-delivery   | string     | null: false                    |
| item-price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card-number    | integer    | null: false                    |
| card-exp-month | integer    | null: false                    |
| card-exp-year  | integer    | null: false                    |
| card-cvc       | integer    | null: false                    |
| postal-code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: true                     |
| phone-number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item