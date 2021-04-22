class OrdersController < ApplicationController
  @orders = Order.all
end
