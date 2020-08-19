class PurchasesController < ApplicationController
  before_action :move_to_index
  def index
    @purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])

    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :block_num, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def token_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: token_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.where(item_id: @item.id)
    redirect_to root_path unless user_signed_in?
    redirect_to root_path if @purchase.present? || user_signed_in? && (current_user.id == @item.user.id)
  end
end
