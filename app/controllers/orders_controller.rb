class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  
  def index
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    else
      @item
      @order_address = OrderAddress.new
    end
  end

  def create
    @item
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
