FactoryBot.define do
  factory :item do
    image
    name
    comment
    category_id
    status_id
    burden_id
    ship_origin_id
    ship_day_id
    user_id
  end
end
