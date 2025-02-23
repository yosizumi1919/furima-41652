class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :region_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
  
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :region
  belongs_to :day

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :day_id, numericality: { other_than: 1 , message: "can't be blank" }

end
