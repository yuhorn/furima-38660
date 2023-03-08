class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :last_name, format: { with: VALID_NAME_REGEX }
  validates :first_name, format: { with: VALID_NAME_REGEX }
  VALID_KANA_REGEX = /\A[ァ-ヴー]+\z/u.freeze
  validates :last_name_kana, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
end
