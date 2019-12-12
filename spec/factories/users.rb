FactoryBot.define do
  
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    last_name             {"testlast"}
    first_name            {"testfirst"}
    last_name_kana        {"testlastkana"}
    first_name_kana       {"testfirstkana"}
    birthday              {"2109-05-08"}
    agreement             {"1"}
    phone_number          {"09000000000"}
  end


end