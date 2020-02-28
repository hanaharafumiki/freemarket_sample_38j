class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :user
  # belongs_to :category
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand

  validates_associated :images

  validates :name,  presence: true, length: {maximum: 40}
  validates :description,  presence: true , length: {maximum: 1000}
  # validates :status, :category, presence: true


end
