class Address < ApplicationRecord
  #validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/},numericality: { only_integer: true }
  #validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  #validates :municipalities, presence: true
  #validates :block_number, presence: true
  #validates :building_name, presence: true
  #validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/},numericality: { only_integer: true }

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ShippingArea
end

