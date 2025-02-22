class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :region_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user

end
