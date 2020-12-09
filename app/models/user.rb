class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :password
    validates :email, uniqueness: true
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :mypages
  has_many :comments, dependent: :destroy
  has_many :follower, class_name: 'Relationship', dependent: :destroy, foreign_key: 'follower_id'
  has_many :followed, class_name: 'Relationship', dependent: :destroy, foreign_key: 'followed_id'
  has_many :following_users, through: :follower, source: :followed
  has_many :follower_users, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    p user
    p self
    p following_users
    following_users.include?(user)
  end
end
