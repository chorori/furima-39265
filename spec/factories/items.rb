FactoryBot.define do
  factory :item do
    name               { "テスト商品" }
    description        { "テスト商品の説明" }
    category_id        { 1 }
    condition_id       { 1 }
    shipping_fee_id    { 1 }
    shipping_region_id { 1 }
    shipping_day_id    { 1 }
    price              { 500 }
  end
end
