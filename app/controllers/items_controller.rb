class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @purchases = Purchase.all
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
    @item = Item.find(params[:id])
    @user = current_user
    @purchases = Purchase.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :status_id, :burden_id, :ship_origin_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
