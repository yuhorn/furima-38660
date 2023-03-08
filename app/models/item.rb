class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_sales_status_id
    validates :prefecture_id
    validates :item_schedule_delivery_id
    validates :item_shipping_fee_status_id
    validates :item_price
  end

  belongs_to :user
  has_one :order
end
