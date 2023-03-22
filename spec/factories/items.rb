FactoryBot.define do
  factory :item do
    item_name                   {"test"}
    item_info                   {"test"}
    item_category_id            {2}
    item_sales_status_id        {2}
    item_shipping_fee_status_id {2}
    prefecture_id               {2}
    item_schedule_delivery_id   {2}
    item_price                  {"1000"}
    association :user

    image {Rack::Test::UploadedFile.new("public/images/test_image.png", "image/png")}
  end
end
