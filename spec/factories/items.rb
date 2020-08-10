FactoryBot.define do
  factory :item do
    name             { 'aaaa' }
    comment          { 'ああああ' }
    price            { '1000' }
    category_id         { 4 }
    status_id           { 3 }
    burden_id           { 3 }
    ship_origin_id      { 3 }
    ship_day_id         { 3 }
    association :user
  end
end
