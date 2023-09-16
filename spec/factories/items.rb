FactoryBot.define do
  factory :item do
    association :user
    name               { "テスト商品" }
    description        { "テスト商品の説明" }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_fee_id    { 2 }
    shipping_region_id { 2 }
    shipping_day_id    { 2 }
    price              { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.jpg'), filename: 'image.jpg')
    end
  end
end
