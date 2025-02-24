class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  before_validation :convert_full_width_to_half_width

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :region_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :region
  belongs_to :day

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id, numericality: { other_than: 1, message: "can't be blank" }



  validate :must_be_half_width

  private

  def must_be_half_width
    if price.to_s.tr('０-９', '0-9').to_i.to_s != price.to_s.strip
      errors.add(:price, "is not a valid half-width number")
    end
  end

  def convert_full_width_to_half_width
    self.price = price.to_s.tr('０-９', '0-9').to_i
  end


end
