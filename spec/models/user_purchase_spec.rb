require 'rails_helper'

describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end
  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '必須項目が存在すれば購入できる' do
        expect(@user_purchase).to be_valid
      end

      it '郵便番号にハイフンを含んでいれば購入できる' do
        @user_purchase.postal_code = '222-2222'
        expect(@user_purchase).to be_valid
      end
      it '電話番号にハイフンが含まれず、11けた以内の数字であれば購入できる' do
        @user_purchase.phone = '0802222222'
        expect(@user_purchase).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号が空だと購入できない' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?

        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空だと購入できない' do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_purchase.block_num = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Block num can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @user_purchase.phone = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it '郵便番号にハイフンが含まれていなければ購入できない' do
        @user_purchase.postal_code = '1112222'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code -(ハイフン)を含めて入力してください')
      end
      it '電話番号にハイフンが含まれていれば購入できない' do
        @user_purchase.phone = '080-2222-22'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone -(ハイフン)を含めず入力してください')
      end
    end
  end
end
