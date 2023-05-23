FactoryBot.define do
  factory :order_address do
     post_code {'123-1234'}
     shipping_area_id { 3 }
     municipalities {'大阪市大阪府'}
     block_number {'1234'}
     phone_number {'09000000000'}
     token {"tok_abcdefghijk00000000000000000"}
     building_name {'ああああ'}
 

  end
end
