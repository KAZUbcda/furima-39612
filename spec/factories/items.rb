FactoryBot.define do
  factory :item do
    association :user

    name               { 'サンプル' }
    explanation        { 'テスト用の説明' }
    category_id        { '2' }
    condition_id       { '2' }
    delivery_charge_id { '2' }
    pref_id            { '2' }
    days_to_ship_id    { '2' }
    price              { '300' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
