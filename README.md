# テーブル設計

## users テーブル
| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| email        | string  | null: false   |
| password     | string  | null: false   |
| name         | string  | null: false   |
| gender       | string  |               |
| introduction | string  |               |

### Association
- has_many :prototypes 
- has_many :comments
- has_many :relationships foreign_key: 'follower_id'
- has_many :relationships foreign_key: 'followed_id'
- has_many :following_users, through: :follower, source: :followed
- has_many :follower_users, through: :followed, source: :follower


##  mypages テーブル
| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| title      | string       | null: false                    |
| catch_copy | text         | null: false                    |
| concept    | text         | null: false                    |
| user       | references   | null: false, foreign_key: true |

### Association
- has_many :comments 
- belongs_to :user


## comments テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false,                   |
| user        | references | null: false, foreign_key: true |
| mypage      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :mypage


## relationships テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| follower_id | bigint     | null: false, foreign_key: true |
| followed_id | bigint     | null: false, foreign_key: true |

### Association
- belongs_to :follower, class_name: 'User'  
- belongs_to :followed, class_name: 'User'

