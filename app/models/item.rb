class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :description, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
  validates :item_condition_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
  validates :shipping_fee_payer_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
  validates :shipping_area_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
  validates :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true },
                    presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Genre
  belongs_to :ItemCondition
  belongs_to :ShippingFeePayer
  belongs_to :ShippingArea
  belongs_to :ShippingDay
  

  def sold_out?
    sold_out==false
  end
end
