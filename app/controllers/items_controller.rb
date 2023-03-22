class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
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
    if current_user != @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id, :prefecture_id, :item_schedule_delivery_id, :item_shipping_fee_status_id, :item_price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
