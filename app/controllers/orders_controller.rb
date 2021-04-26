class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @order = OrdersAddress.new
  end

  def create
    @order = OrdersAddress.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_c1137f54fdf247333cfd3549"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'    # 通貨の種類（日本円）
      )
      @order.save
      redirect_to  root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_address).permit(:name, :postal_code, :prefecture_id, :street, :city, :build, :phone_number, :order_id ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
      @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order.present?
       redirect_to  root_path 
    end
    
  end    
end



