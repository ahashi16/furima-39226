class ItemsController < ApplicationController
  before_action :set_item, only:[:show,:edit,:update]
  before_action :authenticate_user!,only:[:new,:edit]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
   unless  @item.user_id == current_user.id
      redirect_to root_path 
      return
    end
    
   unless @item.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :genre_id, :item_condition_id, :shipping_fee_payer_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end
  end
end
