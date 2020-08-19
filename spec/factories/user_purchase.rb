FactoryBot.define do
  factory :user_purchase do
    postal_code    { '669-1133' }
    city           { '西宮市' }
    block_num      { '34-13' }
    building       { 'ビル' }
    phone          { '0801111111' }
    prefecture_id  { 29 }
    user_id        {2}
  end
end
