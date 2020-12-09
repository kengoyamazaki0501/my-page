class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を正しく入力してください'}
    validates :password
    validates :email,uniqueness: true   
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,            length: { minimum: 6 }
  validates_format_of :password, with: PASSWORD_REGEX



  has_many :mypages
  has_many :comments,dependent: :destroy
end
