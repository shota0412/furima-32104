# テーブル設計

## users テーブル

| Column      | Type   | Options   |
| --------     | ------ | --------- |
| name         | string | null: false |
| email         | string | null: false |
| password  | string | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options           |
| ------         | ------     | -----------       |
| name           | string     | null: false       |
| text           | text       | null: false       |
| category       | string     | null: false       |
| status         | string     | null: false       |
| delivery_cost  | integer    | null: false       |
| delivery_from  | string     | null: false       |
| delivery_date  | datetime   | null: false       |
| price          | integer    | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column      | Type       | Options           |
| ------      | ------     | -----------       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |
| buyer_info  | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :items
- has_one :buyer_info

## buyer_info テーブル

| Column       | Type       | Options           |
| ---------    | ---------- | ----------------- |
| credit_card  | integer    | null: false       |
| zip          | integer    | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| address      | string     | null: false       |
| phone_number | integer    | null: false       |
| order        | references | foreign_key: true |


### Association

- has_one :orders

