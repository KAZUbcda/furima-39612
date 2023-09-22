FactoryBot.define do
  factory :shipping_address do
    association :purchase_record
  end
end
