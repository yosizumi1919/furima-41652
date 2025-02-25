FactoryBot.define do
  factory :item do
    item_name          { Faker::Name.name }
    explanation        { Faker::String.random }
    category_id        { 2 }
    status_id          { 2 }
    burden_id          { 2 }
    region_id          { 2 }
    day_id             { 2 }
    price              { 400 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
