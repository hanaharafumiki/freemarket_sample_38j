class Item < ApplicationRecord
  # belongs_to user, foreign_key: 'user_id'
  # belongs_to brand, foreign_key: 'brand_id'
  # belongs_to category
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end