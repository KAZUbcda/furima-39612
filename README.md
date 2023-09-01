# テーブル設計

## usersテーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| password_confirmation | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_name_kana       | string | null: false               |
| last_name_kana        | string | null: false               |
| date_of_birth         | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipper_area_id    | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_records

## shipping_addressesテーブル
| Column             | Type       | Options                           |
| ------------------ | ---------- | --------------------------------- |
| post_code          | string     | null: false                       |
| pref               | integer    | null: false                       |
| municipalities     | string     | null: false                       |
| street_address     | string     | null: false                       |
| bldg_name          | string     |                                   |
| tel_number         | integer    | null: false                       |
| item               | references | null: false, foreign_key: true    |

### Association
- belongs_to :items


## purchase_recordsテーブル
| Column             | Type       | Options                        |
| ------------------ | -------    | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| shipping_addresses | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :shipping_addresses

<!-- ## commentsテーブル -->
<!-- | Column             | Type       | Options                        | -->
<!-- | ------------------ | ---------- | ------------------------------ | -->
<!-- | content            | string     | null: false                    | -->
<!-- | user               | references | null: false, foreign_key: true | -->
<!-- | item               | references | null: false, foreign_key: true | -->
