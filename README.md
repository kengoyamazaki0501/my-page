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



# アプリケーション概要
## アプリ名： MyPage
利用者が自分の得意な知識を、誰かに提供する
プラットフォームを意識しました。また、
利用者同士がコミュニケーションを図る事で個人と個人が繋がれ、発信だけでなく人とつながれように製作しました。


# アプリケーションURL



# テスト用アカウント



# 利用方法
### 1,  テストアカウントにてログインお願いします。
### 2,  新規投稿から投稿をすると一覧で投稿の内容が表示されます。
### 3,  投稿内容に対してコメントすることができます。
### 4,  投稿の詳細ページにいく事で、投稿者をフォローすることができます。
### 5,  検索機能で投稿の検索ができる仕様なっております。


# 目指した課題解決

昨今、個人が情報発信をできるプラットフォームは多様にあるが、
サービスが増れば、増えるほど複雑になり、利用の方法が難しくなるように感じます。そこで、動画の投稿ができ、画像フィルの共有が手軽にできるできる、サービスがあれば、本来もっと注目を集めて輝ける方がより多くの人に見てもらえる様になるのではと思い、サービスの開発をしました。


# 要件

### 1
ユーザー同士がアプリケーション内でつながれる様にすること

### 2
画像だけでなく、動画の投稿もできる様にすること

### 3
投稿内容にコメント機能を持たせて、どんなユーザーがコメントを残したのかを
わかる様にすること

### 4
SNSのアカウントをユーザーの詳細画面に掲示させ、ユーザー同士の繋がりをより強くすること

### 5
投稿の検索がログイン中であればどこからでもできる様にすること

# 実装予定の機能
ユーザーの詳細ページで、どのユーザーにフォローされていて、どのユーザーをフォローしているのかを表示させたいと思っております。


# データベース設計


# ローカルでの動作




