class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
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
    params.permit(:postal_code, :city, :block_num, :building, :phone, :prefecture_id).merge(:item_id, params[:item_id])
  end
  
end
