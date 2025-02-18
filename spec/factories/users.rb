FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanji_first_name      {'佐久間'}
    kanji_last_name       {'太郎'}
    kana_first_name       {'サクマ'}
    kana_last_name        {'タロウ'}
    birth_date            {'1999-09-09'}
  end
end