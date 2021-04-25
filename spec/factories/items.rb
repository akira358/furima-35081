FactoryBot.define do
  factory :item do
    name {'サンプル'}
    text {'サンプル商品です'}
    category_id {2}
    info_id{2}
    shipping_fee_status_id{2}
    prefecture_id{2}
    schedule_id{2}
    price{1000}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_image.png')
    end
  end
end