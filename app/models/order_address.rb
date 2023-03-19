class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end

  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :prefecture_id
    validates :order_id
    validates :user_id
    validates :item_id
  end

  VALID_POSTALCODE_REGIX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, format: { with: VALID_POSTALCODE_REGIX, message: "is invalid. Include hyphen(-)" }
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/.freeze
  validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX, message: "is invalid." }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end