FactoryBot.define do
  factory :item do
    name              {"ぶどう"}
    text              {"おいしいぶどう"}
    category_id       {"2"}
    status_id         {"2"}
    delivery_cost_id  {"2"}
    prefecture_id     {"2"}
    delivery_date_id  {"2"}
    price             {"1000"}
    association :user
  end
end
