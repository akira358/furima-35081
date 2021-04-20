class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :info_id, :shipping_fee_status_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  
end