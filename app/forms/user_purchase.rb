class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :block_num, :building, :phone, :prefecture_id, :item_id, :user_id

  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, :city, :block_num, :phone, presence: true
  POSTALCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :postal_code, with: POSTALCODE_REGEX, message: '-(ハイフン)を含めて入力してください' 
  PHONE_REGEX = /\A\d{,11}\z/.freeze
  validates_format_of :phone, with: PHONE_REGEX, message: '-(ハイフン)を含めず入力してください' 

  def save
    Purchase.create(user_id: user_id, item_id: item_id)

    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_num: block_num, building: building, phone: phone, item_id: item_id)
  end
end
