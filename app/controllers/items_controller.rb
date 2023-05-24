class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  
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
    if @item.user_id != current_user.id || @item.sold_out?
      redirect_to root_path
      return
    end

    return if @item.present?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render action: :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :genre_id, :item_condition_id, :shipping_fee_payer_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id,sold_out: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
