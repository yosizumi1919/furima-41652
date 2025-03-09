class Form
  include ActiveModel::Model

  attr_accessor :address_number, :region_id, :city, :street, :building, :phone_number, :user_id, :item_id, :order_id, :token

  with_options  presence: true do
    validates :address_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :city
    validates :street
    validates :phone_number, length: { only_integer: true, in: 10..11, message: 'is invalid' }
    validates :token
  end
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
end
