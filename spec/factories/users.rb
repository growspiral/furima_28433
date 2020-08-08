FactoryBot.define do
  factory :user do
    nickname                    {Faker::Name.initials(number: 2)}
    email                       {Faker::Internet.free_email}
    password                    {"aaa333"}
    password_confirmation       {password}
    first_name                  {"田中"}
    last_name                   {"太朗"}
    first_kana                  {"タナカ"}
    last_kana                   {"タロウ"}
    birthday                    {"2000-3-20"}
  end
end