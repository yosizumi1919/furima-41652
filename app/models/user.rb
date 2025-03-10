class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_first_name, presence: true
  validates :kanji_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX

  KANJI_FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶー-龥々ー]+\z/
  validates_format_of :kanji_first_name, with: KANJI_FIRST_NAME_REGEX

  KANJI_LAST_NAME_REGEX = /\A[ぁ-んァ-ヶー-龥々ー]+\z/
  validates_format_of :kanji_last_name, with: KANJI_LAST_NAME_REGEX

  KANA_FIRST_NAME_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :kana_first_name, with: KANA_FIRST_NAME_REGEX

  KANA_LAST_NAME_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :kana_last_name, with: KANA_LAST_NAME_REGEX

  has_many :items
  has_many :orders
end
