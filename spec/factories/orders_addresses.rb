FactoryBot.define do
  factory :orders_address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'東京都'}
    street {'1-1'}
    build {'東京ハイツ'}
    phone_number '2000'
    token {"sampletoken"}

    
  end
end
