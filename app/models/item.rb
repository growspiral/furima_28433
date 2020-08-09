class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :ship_origin
  belongs_to_active_hash :ship_day
  validates :category_id, :status_id, :burden_id, :ship_origin_id, :ship_day_id, numericality: { other_than: 1 }
  belongs_to :user
  has_one_attached :image
end
