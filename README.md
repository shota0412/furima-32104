# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| --------            | ------  | ---------   |
| name                | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_furigana | string  | null: false |
| last_name_furigana  | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options           |
| ------            | ------     | -----------       |
| name              | string     | null: false       |
| text              | text       | null: false       |
| category_id       | integer    | null: false       |
| status_id         | integer    | null: false       |
| delivery_cost_id  | integer    | null: false       |
| delivery_from_id  | integer    | null: false       |
| delivery_date_id  | integer    | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options           |
| ------      | ------     | -----------       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :buyer_info

## buyer_info テーブル

| Column        | Type       | Options           |
| ---------     | ---------- | ----------------- |
| zip           | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |


### Association

- belongs_to :orders
