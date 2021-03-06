class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @order = OrdersAddress.new
  end

  def create
    @order = OrdersAddress.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: params[:token],    
        currency: 'jpy'    
      )
      @order.save
      redirect_to  root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_address).permit(:name, :postal_code, :prefecture_id, :street, :city, :build, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index

    if current_user.id == @item.user.id || @item.order.present?
       redirect_to  root_path 
    end
    
  end    
end



