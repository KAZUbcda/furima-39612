# テーブル設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | string     | null: false                    |
| category           | integer    | null: false, foreign_key: true |
| condition          | integer    | null: false, foreign_key: true |
| delivery_charge    | integer    | null: false, foreign_key: true |
| shipper_area       | integer    | null: false, foreign_key: true |
| days_to_ship       | integer    | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## shipping_addressesテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | string  | null: false |
| pref.              | string  | null: false |
| municipalities     | string  | null: false |
| street_address     | string  | null: false |
| bldg._name         | string  | null: false |
| tel._number        | integer | null: false |

## purchase_recordsテーブル
| Column             | Type       | Options                        |
| ------------------ | -------    | ------------------------------ |
|sales_status        | integer    | null: false                    |
|user                | references | null: false, foreign_key: true |
|item                | references | null: false, foreign_key: true |

## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
