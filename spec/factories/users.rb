FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'baseball1'}
    password_confirmation {'baseball1'}
    last_name             {'山田'}
    first_name            {'太郎'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birthday              {'1995-07-24'}
  end
end
