FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { '456def' }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '太郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'タロウ' }
    date_of_birth         { '2000/1/1' }
  end
end
