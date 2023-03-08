class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(@item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :prefecture_id, :item_schedule_delivery_id, :item_shipping_fee_status_id, :item_price).merge(user_id: current_user.id)
  end
end
