class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, allow_blank: true }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :last_name, format: { with: VALID_NAME_REGEX, allow_blank: true }
  validates :first_name, format: { with: VALID_NAME_REGEX, allow_blank: true }
  VALID_KANA_REGEX = /\A[ァ-ヴー]+\z/u.freeze
  validates :last_name_kana, format: { with: VALID_KANA_REGEX, allow_blank: true }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX, allow_blank: true }
end
