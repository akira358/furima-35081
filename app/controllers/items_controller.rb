class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
     # @item.update(item_params)
   if @item.valid?
      @item.save
      redirect_to item_path
    else
      render :edit
    end
  end 
  
  def show
    @item = Item.find(params[:id])
  end

  
  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :info_id, :shipping_fee_status_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end
    
  def move_to_index
    unless current_user.id == @item.user.id
           redirect_to action: :index
    end
  
     unless current_user.id?
            redirect_to action: :index
    end  

     
  end         
  
  def set_item
    @item = Item.find(params[:id])
  end
 end
