FactoryBot.define do
  factory :item do
    name              { 'ぶどう' }
    text              { 'おいしいぶどう' }
    category_id       { 2 }
    status_id         { 2 }
    delivery_cost_id  { 2 }
    prefecture_id     { 2 }
    delivery_date_id  { 2 }
    price             { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test-image.jpg'), filename: 'test_image.png')
    end
  end
end
