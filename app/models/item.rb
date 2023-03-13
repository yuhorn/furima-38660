class Item < ApplicationRecord
  with_options presence: true do
    validates :item_image
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_sales_status_id
    validates :prefecture_id
    validates :item_schedule_delivery_id
    validates :item_shipping_fee_status_id
    validates :item_price
  end

  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :item_category_id
    validates :item_sales_status_id
    validates :prefecture_id
    validates :item_schedule_delivery_id
    validates :item_shipping_fee_status_id
  end

  validates :item_name, length: {maximum: 40}
  validates :item_info, length: {maximum: 1000}
  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :item_price, length: {minimum: 3, maximum: 7}, format: {with: VALID_PRICE_REGEX, allow_blank: true}

  belongs_to :user
  has_one :order
  has_one_attached :item_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_schedule_delivery
end