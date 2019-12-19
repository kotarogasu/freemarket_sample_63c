FactoryBot.define do
  
  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, max_length: 10)}
    last_name             {Gimei.first.kanji}
    first_name            {Gimei.last.kanji}
    last_name_kana        {Gimei.first.hiragana}
    first_name_kana       {Gimei.last.hiragana}
    birthday              {Faker::Date.birthday(min_age = 18, max_age = 65)}
    agreement             {"1"}
    phone_number          {"09000000000"}
  end


end