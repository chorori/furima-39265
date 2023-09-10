class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthdate, presence: true
end
