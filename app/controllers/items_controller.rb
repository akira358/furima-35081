class ItemsController < ApplicationController
  def index
    @item = Item.new
  end
  
  def create
  end
end
