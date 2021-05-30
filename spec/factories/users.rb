FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {gimei.last.kanji }
    first_name            {gimei.first.kanji}
    kana_last_name        {gimei.last.katakana}
    kana_first_name       {gimei.first.katakana}
    birthday              {Faker::Date.in_date_period}
  end
end
