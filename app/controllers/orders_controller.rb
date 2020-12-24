class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]
before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end 
      @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
    
  private
  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end