class Order < ApplicationRecord
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
  #validates :price, presence: true
  belongs_to :item
  belongs_to :user
  has_one :address
end
