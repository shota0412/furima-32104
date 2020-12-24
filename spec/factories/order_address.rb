FactoryBot.define do
  factory :order_address do
    zip              { '111-2222' }
    prefecture_id       { 2 }
    city             { "テスト町" }
    address          { "テスト1-1-1" }
    building         { "テスト101" }
    phone_number     { '09011112222' }
  end
end