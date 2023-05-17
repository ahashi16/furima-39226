FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { 'あいうえお' }
    last_name { 'かきくけこ' }
    first_name_kana { 'アイウエオ' }
    last_name_kana { 'カキクケコ' }
    birth_day { Faker::Date.backward }
  end
end
