# テーブル設計

## users テーブル
| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| email        | string  | null: false   |
| password     | string  | null: false   |
| name         | string  | null: false   |
| gender       | string  |               |
| introduction | string  |               |
| twitter      | string  |               |
| facebook     | string  |               |
| instagram    | string  |               |
| youtube      | string  |               |

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
### 6,  SNSアカウントは編集画面から削除が可能でございます。仕様確認後は削除をおすすめいたします。


# 目指した課題解決

昨今、個人が情報発信をできるプラットフォームは多様にあるが、
サービスが増れば、増えるほど複雑になり、利用の方法が難しくなるように感じます。そこで、動画の投稿ができ、画像フィルの共有が手軽にできるできる、サービスがあれば、本来もっと注目を集めて輝ける方がより多くの人に見てもらえる様になるのではと思い、サービスの開発をしました。


# 要件

##  ユーザー同士がアプリケーション内でつながれる様にするために、下記の機能を実装しました。

### 1
画像だけでなく、動画の投稿もできる様にすること

![260f63b0f410a5ea92c9a780464df1b4](https://user-images.githubusercontent.com/73152667/102046092-f2001f00-3e1d-11eb-8f85-84b59ac221f3.gif)


### 2
投稿内容にコメント機能を持たせて、どんなユーザーがコメントを残したのかを
わかる様にすること

[![Image from Gyazo](https://i.gyazo.com/f498703cd7131a8b44fca311f2571cd8.gif)](https://gyazo.com/f498703cd7131a8b44fca311f2571cd8)

### 3
SNSのアカウントをユーザーの詳細画面に掲示させ、ユーザー同士の繋がりをより強くすること
#### [インスタグラム遷移]
![284857f98a870010e6eb4b9149f60d92](https://user-images.githubusercontent.com/73152667/102046796-6a1b1480-3e1f-11eb-91b9-d1e461f130a3.gif)

#### [ツイッター遷移]
[![Image from Gyazo](https://i.gyazo.com/a7b8faa46f2a85ad5a935794f22bd738.gif)](https://gyazo.com/a7b8faa46f2a85ad5a935794f22bd738)

#### [フェイスブック遷移]
![dcacbff2f016fd43a27f0f6c33f11186](https://user-images.githubusercontent.com/73152667/102047272-4f956b00-3e20-11eb-87d2-02dc9f07a654.gif)


#### [ユーチューブ遷移]
[![Image from Gyazo](https://i.gyazo.com/106b808237542404eadc358ad0f08f7c.gif)](https://gyazo.com/106b808237542404eadc358ad0f08f7c)

### 4
投稿の検索がログイン中であればどこからでもできる様にすること
![0d240b135a4bb84a1525a4b8ee6926c0](https://user-images.githubusercontent.com/73152667/102047448-9d11d800-3e20-11eb-935f-c768b680e93b.gif)


# 実装予定の機能
ユーザーの詳細ページで、どのユーザーにフォローされていて、どのユーザーをフォローしているのかを表示させたいと思っております。


# データベース設計


# ローカルでの動作




