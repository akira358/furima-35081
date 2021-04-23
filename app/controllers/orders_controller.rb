class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
 binding.pry
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_coad, :city, :build, :phone_number, :order_id ).merge(user_id: current_user.id)
  end

end


