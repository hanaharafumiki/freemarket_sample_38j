class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday_year, :birthday_month, :birthday_day, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :family_name, presence: true, format: { with: /\A(?:\p{Hiragana}|[ー－]|[一-龠々])+\z/ }
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|[ー－]|[一-龠々])+\z/ }
  validates :family_furigana, presence: true, format: { with: /[\p{katakana} ー－]+/ }
  validates :first_furigana, presence: true, format: { with: /[\p{katakana} ー－]+/ }
  has_one :address
  has_many :cards
  has_many :items
end

