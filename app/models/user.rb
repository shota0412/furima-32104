class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, uniqueness: true

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  # validates :encrypted_password, format: {with: PASSWORD_REGEX}
  
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: {with: NAME_REGEX}
  validates :last_name, presence: true, format: {with: NAME_REGEX}

  FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_furigana, presence: true, format: {with: FURIGANA_REGEX}
  validates :last_name_furigana, presence: true, format: {with: FURIGANA_REGEX}
  validates :birthday, presence: true    
end
