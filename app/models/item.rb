class Item < ApplicationRecord
  validates :product_name,presence: true
  validates :description,presence: true
  validates :user,presence: true
  validates :genre_id, numericality: { other_than: 1 ,message: "can't be blank"},presence: true
  validates :item_condition_id, numericality: { other_than: 1 ,message: "can't be blank"},presence: true
  validates :shipping_fee_payer_id, numericality: { other_than: 1 ,message: "can't be blank"},presence: true
  validates :shipping_area_id, numericality: { other_than: 1 ,message: "can't be blank"},presence: true
  validates :shipping_day_id, numericality: { other_than: 1 ,message: "can't be blank"},presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300 ,less_than_or_equal_to:9999999}, presence: true
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Genre
  belongs_to :ItemCondition
  belongs_to :ShippingFeePayer
  belongs_to :ShippingArea
  belongs_to :ShippingDay
end
