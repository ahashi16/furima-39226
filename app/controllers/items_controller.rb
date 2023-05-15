class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def create
    @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
     render :new
   end
 end


  private
  def item_params
    params.require(:item).permit(:product_name,:description,:genre_id,:item_condition_id,:shipping_fee_payer_id,:shipping_area_id,:shipping_day_id,:price,:image).merge(user_id:current_user.id)
  end
end
