class DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @item = Item.find(params[:item_id])
  end

  def create
   
   
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :city, :block_num, :building, :phone, :prefecture_id, :item_id).merge(item_id: params[:item_id])
  end
  
end


