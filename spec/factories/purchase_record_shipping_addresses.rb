FactoryBot.define do
  factory :purchase_record_shipping_address do
    post_code      { '123-4567' }
    pref_id        { '15' }
    municipalities { '横浜市緑区' }
    street_address { '青山1-1-1' }
    bldg_name      { '柳ビル103' }
    tel_number     { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
