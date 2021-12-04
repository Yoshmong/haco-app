Name Haconi やさい
====

# 概要
本アプリは、香川県内の野菜販売者が設置した、無人販売所（箱）について、提供された場所、時間、販売されている商品を検索し、設置された箱情報を提供することを目的としている。  


# 実装内容  
（箱情報投稿）野菜を販売したい人が、商品を販売する場所、商品詳細について投稿する機能
（箱情報一覧）投稿された箱情報を一覧する機能  

  
## 今後実装する予定の機能
  箱設置者詳細情報と、コメント投稿

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |

### Association
- user has many :comments
- user has many :spots

## spots テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| spot_id| integer | null:false|
| user | references | null:false, foreign_key: true|
| spot_name| string | null: false |
| area_id| integer | null:false| 
| postal_code  | string | null: false |
| address| string | null:false| 
| building | string |  |
| phone_number | string | null: false | 

### Association
- spot belongs to :user, dependent :destroy
- spot has many :events
- belongs_to_active_hash :area

## events テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null:false, foreign_key: true|
| spot | references | null:false, foreign_key: true|
| category_id| integer | null: false | 
| event_title | string | null:false| 
| event_detail| text | null: false | 
| start_time | datetime | null: false |
| end_time | datetime | null: false | 

### Association
- event belongs to :spot, dependent :destroy
- event has many :comments
- belongs_to_active_hash :area
- belongs_to_active_hash :category


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| event    | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

### Association
- comments belongs to :user, dependent :destroy
- comments belongs to :event