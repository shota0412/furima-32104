class OrdersController < ApplicationController
before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
    
  private
  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :zip, :prefecture_id, :city, :address, :building, :phone_number, :order_id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end