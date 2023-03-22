FactoryBot.define do
  factory :order_address do
    postal_code   {'123-4567'}
    prefecture_id {2}
    city          {'札幌市'}
    address       {'1-1'}
    building      {'sapporoハイツ'}
    phone_number  {'1234567890'}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
