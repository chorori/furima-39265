class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_region_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
