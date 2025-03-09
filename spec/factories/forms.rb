FactoryBot.define do
  factory :form do
    address_number { '123-4567' }
    region_id { 2 }
    city { 'ああああ' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { 2_000_000_000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
