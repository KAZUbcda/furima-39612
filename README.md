# テーブル設計

## usersテーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
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
| pref_id            | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## shipping_addressesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| pref_id         | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| street_address  | string     | null: false                    |
| bldg_name       | string     |                                |
| tel_number      | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record


## purchase_recordsテーブル
| Column             | Type       | Options                        |
| ------------------ | -------    | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

<!-- ## commentsテーブル -->
<!-- | Column             | Type       | Options                        | -->
<!-- | ------------------ | ---------- | ------------------------------ | -->
<!-- | content            | string     | null: false                    | -->
<!-- | user               | references | null: false, foreign_key: true | -->
<!-- | item               | references | null: false, foreign_key: true | -->
