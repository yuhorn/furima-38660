class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  VALID_POSTALCODE_REGIX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  validates :postal_code, format: { with: VALID_POSTALCODE_REGIX, message: "is invalid. Include hyphen(-)", allow_blank: true }
  VALID_PHONENUMBER_REGEX = /\A[0-9]{10,11}\z/.freeze
  validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX, message: "is invalid", allow_blank: true }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end