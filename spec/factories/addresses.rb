FactoryBot.define do
  factory :address do
    postal_code { '123-4567 '}
    prefecture_id {1}
    city {'東京都'}
    street {'1-1'}
    build {'東京ハイツ'}
    phone_number {2000}
    
  end
end
