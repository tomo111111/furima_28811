class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :contract

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は無効です。全角文字を入力してください。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は無効です。全角文字を入力してください。' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は無効です。全角カタカナを入力してください。' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は無効です。全角カタカナを入力してください。' }
    validates :birthday
  end
end
