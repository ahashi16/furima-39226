class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id,
  :municipalities, :block_number, :building_name, :phone_number,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :block_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/},numericality: { only_integer: true }
    validates :token
    
  end

 def save
  order=Order.create(user_id: user_id,item_id: item_id)
  Address.create(post_code: post_code,shipping_area_id: shipping_area_id,municipalities: municipalities,
    block_number: block_number, building_name: building_name, phone_number: phone_number,order_id: order.id)
 end

 
end

