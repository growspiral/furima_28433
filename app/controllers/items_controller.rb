class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
    
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
    @user = current_user
    @purchase = Purchase.where(item_id: @item.id)
  end

  def edit
   
  end

  def update
      
    if @item.update(item_params)
      redirect_to root_path
    else
        render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :status_id, :burden_id, :ship_origin_id, :ship_day_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
