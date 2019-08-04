# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

データベース
##Taskテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| task_id | integer | null: false, foreign_key: true |
| name | string | null: false, limit: 30 |
| description | text |  |
| limit | date |  |
| state | integer |  |

### Association
- belongs_to :user

## Userテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| user_id | integer | null: false |
| name | string | null: false |
| email | string | null: false |
| password | string | null: false |

### Association
- has_many :tasks
