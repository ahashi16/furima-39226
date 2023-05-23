class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  
  def index

    @item = Item.find(params[:item_id])
    
    if current_user.id==@item.user_id || @item.sold_out?
      redirect_to root_path
    end

    @order_address=OrderAddress.new
    
  end
  def create
    
    @item = Item.find(params[:item_id])
    @order_address=OrderAddress.new(order_params)
    if @order_address.valid? 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],   
      currency: 'jpy'              
    )
      @order_address.save
      @item.update(sold_out: false)
      return redirect_to root_path
    else
      render :index
      
    end
  end
  private
  def order_params
    params.require(:order_address).permit(:post_code,:shipping_area_id,:municipalities,:block_number,:building_name,
      :phone_number).merge(user_id: current_user.id,item_id:@item.id,price:@item.price,token:params[:token])
  end
  
end


