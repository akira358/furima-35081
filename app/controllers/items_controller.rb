class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
 

  def index
    @items = Item.order("created_at DESC")
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
  
  def edit
  end
  

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end 
  
  def show
  end

   def destroy
     if  @item.destroy
        redirect_to root_path
     end
    end

  
   
   private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :info_id, :shipping_fee_status_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user.id || @item.order.present?
           redirect_to action: :index
    end
  end         
  
  def set_item
    @item = Item.find(params[:id])
  end
end

