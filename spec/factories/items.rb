FactoryBot.define do
  factory :item do
    product_name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    genre_id {2}
    item_condition_id {2}
    shipping_fee_payer_id {2}
    shipping_area_id {2}
    shipping_day_id {2}
    price {1000}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end