# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

データベース

taskテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| task_id | integer | null: false, foreign_key: true |
| name | string | null: false, limit: 30 |
| description | text |  |
| limit | date |  |

### Association
- belongs_to :user

userテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user_id | integer | null: false |
| name | string | null: false |
| email | string | null: false |
| password | string | null: false |

### Association
- has_many :tasks
